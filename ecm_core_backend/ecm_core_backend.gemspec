$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_core_backend"
  s.version     = Ecm::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_core_backend"
  s.summary     = "Ecm Core Module."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,spec}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "administrador"

  s.add_development_dependency "sqlite3"

  # s.add_development_dependency 'capybara'
  # s.add_development_dependency 'factory_girl_rails'
  # s.add_development_dependency 'guard-bundler'
  # s.add_development_dependency 'guard-rspec'
  # s.add_development_dependency 'i18n-debug'
  # s.add_development_dependency 'launchy'
  # s.add_development_dependency 'pry-rails'
  # s.add_development_dependency 'rspec-rails'
  # s.add_development_dependency 'rubocop'
  # s.add_development_dependency 'shoulda-matchers'
end
