$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_cms2'
  s.version     = Ecm::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_cms2'
  s.summary     = 'CMS base module for ruby on rails.'
  s.description = 'CMS base module for ruby on rails.'

  s.files = Dir['{app,config,db,lib}/**/*', 'spec/factories/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '>= 4.0'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'draper'
  s.add_dependency 'rao-service'
  s.add_dependency 'RedCloth'
  s.add_dependency 'simple-navigation', '>= 4.0.0'
  s.add_dependency 'coffee-rails'

  # Documentation
  s.add_development_dependency 'yard'

  # Dummy app
  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'activeadmin', '1.0.0.pre2'
  s.add_development_dependency 'devise'
  s.add_development_dependency 'route_translator'
  s.add_development_dependency 'less-rails'
  s.add_development_dependency 'therubyracer'
  s.add_development_dependency 'twitter-bootstrap-rails'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'rails-i18n'
  s.add_development_dependency 'active_admin-awesome_nested_set'

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'

  # Test automation
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'

  # Development Tools
  s.add_development_dependency 'rubocop'
end
