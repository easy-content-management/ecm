$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_carousels_backend"
  s.version     = Ecm::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_carousels_backend"
  s.summary     = "Ecm::Carousels::Backend."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails'
  s.add_dependency 'ecm_core_backend'
  s.add_dependency "ecm_carousels"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rails-i18n'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop-rails_config'
  s.add_development_dependency 'shoulda-matchers'
end
