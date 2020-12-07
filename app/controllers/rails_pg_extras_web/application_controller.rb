require "rails-pg-extras"

module RailsPgExtrasWeb
  class ApplicationController < ActionController::Base
    layout "rails_pg_extras_web/application"

    if Rails.env.production? && ENV['PG_EXTRAS_USER'].present? && ENV['PG_EXTRAS_PASSWORD'].present?
      http_basic_authenticate_with name: ENV['PG_EXTRAS_USER'], password: ENV['PG_EXTRAS_PASS']
    end

    protect_from_forgery with: :exception

    helper_method :pg_stats_statements_enabled?

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
