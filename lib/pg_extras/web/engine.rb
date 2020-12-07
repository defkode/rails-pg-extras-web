require "rails-pg-extras"

class PgExtras::Web::Engine < ::Rails::Engine
  isolate_namespace PgExtras::Web
end
