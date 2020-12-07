class PgExtras::Web::QueriesController < ActionController::Base
  def index
    @queries_dependent_on_pg_stats_statements = [:calls, :outliers]
    @commands                                 = [:kill_all]

    @all_queries = RailsPGExtras::QUERIES.reject do |query_name|
      query_name.in?(@queries_dependent_on_pg_stats_statements) && ActiveRecord::Base.connection.extensions.exclude?("pg_stat_statements")
    end

    if query_name = params[:query_name].presence
      @query_name = query_name
    else
      @query_name = @all_queries.first
    end

    @result = ActiveRecord::Base.connection.execute(
      RubyPGExtras.sql_for(query_name: @query_name)
    )

    @table = Terminal::Table.new(
      title: RubyPGExtras.description_for(query_name: @query_name),
      headings: @result.count > 0 ? @result[0].keys : ["No results"],
      rows: @result.values
    )
  end
end
