module RailsPgExtrasWeb
  class QueriesController < ApplicationController
    before_action :load_queries
    helper_method :pg_stats_statements_enabled?

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
      query_name.in?([:calls, :outliers]) && !pg_stats_statements_enabled?
    end

    def pg_stats_statements_enabled?
      ActiveRecord::Base.connection.extensions.include?("pg_stat_statements")
    end
  end
end
