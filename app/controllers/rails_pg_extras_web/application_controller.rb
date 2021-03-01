require "rails-pg-extras"

module RailsPgExtrasWeb
  class ApplicationController < ActionController::Base
    layout "rails_pg_extras_web/application"

    if Rails.env.production? && ENV['PG_EXTRAS_USER'].present? && ENV['PG_EXTRAS_PASSWORD'].present?
      http_basic_authenticate_with name: ENV['PG_EXTRAS_USER'], password: ENV['PG_EXTRAS_PASSWORD']
    end
  end
end
