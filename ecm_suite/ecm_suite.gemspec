$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require_relative "../lib/ecm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_suite"
  s.version     = Ecm::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.summary     = "Easy Content Management Suite."
  s.description = "Modular, scalable content management on rails."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails'
  s.add_dependency 'ecm'

  s.add_dependency 'ecm_cms2'
  s.add_dependency 'ecm_cms2_backend'

  s.add_dependency 'ecm_contact2'
  s.add_dependency 'ecm_contact2_backend'

  s.add_dependency 'ecm_files'
  s.add_dependency 'ecm_files_backend'

  s.add_dependency 'ecm_galleries'
  s.add_dependency 'ecm_galleries_backend'

  s.add_dependency 'ecm_lightbox2'

  s.add_dependency 'ecm_links2'
  s.add_dependency 'ecm_links2_backend'

  s.add_dependency 'ecm_rbac'
  s.add_dependency 'ecm_rbac_backend'

  s.add_dependency 'ecm_sliders2'
  s.add_dependency 'ecm_sliders2_backend'

  s.add_dependency 'ecm_tags'
  s.add_dependency 'ecm_tags_backend'

  s.add_dependency 'ecm_user_area2'
  s.add_dependency 'ecm_user_area2_backend'

  s.add_development_dependency 'sqlite3', "~> 1.3.6"
  s.add_development_dependency 'puma'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'i18n-debug'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'git_log_generator'
  s.add_development_dependency 'rails-dummy'
end
