$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_sliders2"
  s.version     = Ecm::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_sliders"
  s.summary     = "ECM Module Template."
  s.description = "ECM Module Template."

  s.files = Dir["{app,config,db,lib,spec}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  # Engine dependencies
  s.add_dependency 'acts_as_list'
  s.add_dependency 'acts_as_markup'
  s.add_dependency 'friendly_id'
  s.add_dependency 'mini_magick'
  s.add_dependency 'rails'
  s.add_dependency 'ecm_core', '>= 0.4.0'

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rails-i18n'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda_matchers'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
end

