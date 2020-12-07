PgExtras::Web::Engine.routes.draw do
  root to: "queries#index"

  post "/queries/run", as: :run_query
end
