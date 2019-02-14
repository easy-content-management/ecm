$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_rbac_backend'
  s.version     = Ecm::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_rbac_backend'
  s.summary     = 'Ecm::Rbac::Backend.'
  s.description = 'Ecm::Rbac::Backend Module.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails'
  s.add_dependency 'ecm_core_backend'
  s.add_dependency 'ecm_rbac'
end
