$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ecm/blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_blog'
  s.version     = Ecm::Blog::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_blog'
  s.summary     = 'Ecm::Blog.'
  s.description = 'Ecm::Blog Module.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib,spec}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails'
  s.add_dependency 'acts_as_list'
  s.add_dependency 'acts_as_published'
  s.add_dependency 'html2markdown'
  s.add_dependency 'kaminari'
  s.add_dependency 'kramdown'
  s.add_dependency 'friendly_id'
  s.add_dependency 'ecm_comments'
end
