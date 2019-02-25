$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/blog/backend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_blog_backend"
  s.version     = Ecm::Blog::Backend::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_blog_backend"
  s.summary     = "Ecm::Blog::Backend."
  s.description = "Ecm::Blog::Backend Module."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "ecm_blog"
  s.add_dependency "rao-query"
end
