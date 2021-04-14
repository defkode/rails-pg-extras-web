$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_pg_extras_web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rails-pg-extras-web"
  spec.version     = RailsPgExtrasWeb::VERSION
  spec.authors     = ["Tomasz Mazur"]
  spec.email       = ["tomasz.mazur@hey.com"]
  spec.summary     = "Web UI for rails-pg-extras"
  spec.homepage    = "https://github.com/defkode/rails-pg-extras-web"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "pg", "~> 1.2"
  spec.add_dependency "rails-pg-extras", "~> 1.6.0"
end
