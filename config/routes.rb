PgExtras::Web::Engine.routes.draw do
  root to: "queries#index"
  resources :queries
end
