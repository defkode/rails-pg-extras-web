require "rails-pg-extras"
require "rails-pg-extras/version"

module RailsPgExtrasWeb
  class ApplicationController < ActionController::Base
    layout "rails_pg_extras_web/application"

    REQUIRED_EXTENSIONS = {
      pg_stat_statements: %i[calls outliers pg_stat_statements_reset],
      pg_buffercache: %i[buffercache_stats buffercache_usage],
      sslinfo: %i[ssl_used]
    }

    ACTIONS = %i[kill_all pg_stat_statements_reset add_extensions]

    if Rails.env.production? && ENV['PG_EXTRAS_USER'].present? && ENV['PG_EXTRAS_PASSWORD'].present?
      http_basic_authenticate_with name: ENV['PG_EXTRAS_USER'], password: ENV['PG_EXTRAS_PASSWORD']
    end
  end
end
