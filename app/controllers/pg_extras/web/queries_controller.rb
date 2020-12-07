class PgExtras::Web::QueriesController < PgExtras::Web::ApplicationController
  before_action :load_queries

  def index; end

  def run
    if @query_name = params[:query_name].presence
      begin
        @result = ActiveRecord::Base.connection.execute RubyPGExtras.sql_for(query_name: @query_name)
      rescue ActiveRecord::StatementInvalid => e
        @error = e.message
      end
    else
      redirect_to root_path
    end
  end
end
