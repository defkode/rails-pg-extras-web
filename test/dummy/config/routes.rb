Rails.application.routes.draw do
  mount RailsPgExtrasWeb::Engine => "/pg_extras"
end
