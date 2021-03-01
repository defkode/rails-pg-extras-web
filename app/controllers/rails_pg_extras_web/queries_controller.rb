module RailsPgExtrasWeb
  class QueriesController < ApplicationController
    before_action :load_queries

    def index
      @query_name = params[:query_name].presence
      return unless @query_name

      @result = RailsPGExtras.run_query(query_name: @query_name.to_sym, in_format: :raw)
    rescue ActiveRecord::StatementInvalid => e
      @error = e.message
    end
  end
end
