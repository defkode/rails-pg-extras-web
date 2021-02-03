module RailsPgExtrasWeb
  class QueriesController < ApplicationController
    before_action :load_queries

    def index; end

    def run
      if @query_name = params[:query_name].presence
        begin
          @result = RailsPGExtras.run_query(query_name: @query_name.to_sym, in_format: :raw)
        rescue ActiveRecord::StatementInvalid => e
          @error = e.message
        end
      else
        redirect_to root_path
      end
    end
  end
end
