$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm"
  s.version     = Ecm::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.summary     = "Easy Content Management."
  s.description = "Modular, scalable content management on rails."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'git_log_generator'
end