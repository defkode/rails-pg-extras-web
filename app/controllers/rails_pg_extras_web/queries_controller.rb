module RailsPgExtrasWeb
  class QueriesController < ApplicationController
    REQUIRED_EXTENSIONS = {
      pg_stat_statements: %i[calls outliers],
      pg_buffercache: %i[buffercache_stats buffercache_usage]
    }

    before_action :load_queries
    helper_method :unavailable_extensions

    def index
      @query_name = params[:query_name]&.to_sym.presence_in(@all_queries.keys)
      return unless @query_name

      @result = RailsPGExtras.run_query(query_name: @query_name.to_sym, in_format: :raw)
    rescue ActiveRecord::StatementInvalid => e
      @error = e.message
    end

    private

    def load_queries
      @all_queries = {}

      ::RailsPGExtras::QUERIES.each do |query_name|
        @all_queries[query_name] = {
          disabled: query_disabled?(query_name),
          command:  query_name == :kill_all
        }
      end
    end

    def query_disabled?(query_name)
      case query_name
      when :calls, :outliers
        unavailable_extensions.key?(:pg_stat_statements)
      when :buffercache_stats, :buffercache_usage
        unavailable_extensions.key?(:pg_buffercache)
      else
        false
      end
    end

    def unavailable_extensions
      return @unavailable_extensions if defined?(@unavailable_extensions)

      extensions = ActiveRecord::Base.connection.extensions
      @unavailable_extensions = REQUIRED_EXTENSIONS.select { |extension, _| !extensions.include?(extension.to_s) }
    end
  end
end
