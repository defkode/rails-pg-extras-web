RailsPgExtrasWeb::Engine.routes.draw do
  resources :queries, only: [:index]

  root to: "queries#index"
end
