$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_lightbox2"
  s.version     = Ecm::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_lightbox"
  s.summary     = "ECM Lightbox Module"
  s.description = "ECM Lightbox Module"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0"

  s.add_development_dependency 'sqlite3'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'git_log_generator'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry-rails'
end

