$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_user_area2'
  s.version     = Ecm::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_user_area2'
  s.summary     = 'ECM User Area.'
  s.description = 'ECM User Area.'

  s.files = Dir['{app,config,db,lib}/**/*', 'spec/factories/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0'

  s.add_dependency 'ecm_core'
  s.add_dependency 'active_model_serializers'
  s.add_dependency 'authlogic'
  s.add_dependency 'bcrypt'
  s.add_dependency 'rao-view_helper'

  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'launchy'

  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'route_translator'
  s.add_development_dependency 'therubyracer'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'less-rails'
  s.add_development_dependency 'twitter-bootstrap-rails'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'formulaic'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'

  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rubocop'
end
