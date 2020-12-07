Rails.application.routes.draw do
  mount PgExtras::Web::Engine => "/pg_extras-web"
end
