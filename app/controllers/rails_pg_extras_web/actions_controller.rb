module RailsPgExtrasWeb
  class ActionsController < ApplicationController
    def run
      @action_name = params[:action_name].to_sym.presence_in(ACTIONS)
      begin
        @result = RailsPGExtras.run_query(query_name: @action.to_sym, in_format: :raw)
      rescue ActiveRecord::StatementInvalid => e
        @error = e.message
      end
    end
  end
end