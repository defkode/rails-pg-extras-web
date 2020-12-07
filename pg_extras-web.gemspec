$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "pg_extras/web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "pg_extras-web"
  spec.version     = PgExtras::Web::VERSION
  spec.authors     = ["Tomasz Mazur"]
  spec.email       = ["defkode@gmail.com"]
  spec.summary     = "Summary of PgExtras::Web."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.0"
  spec.add_dependency "pg"
  spec.add_dependency "rails-pg-extras", "~> 1.2"
end
