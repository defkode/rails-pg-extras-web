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

  spec.add_dependency "rails-pg-extras", ">= 4.0.0"

  spec.metadata = { "rubygems_mfa_required" => "true" }
  spec.post_install_message = "rails-pg-extras-web is deprecated. Please use rails-pg-extras instead (>= 4.0.0)"
end
