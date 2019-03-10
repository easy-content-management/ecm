require 'ecm/blog/backend/configuration'
require "ecm/blog/backend/engine"

module Ecm
  module Blog
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:blog_backend, Ecm::Blog::Backend) }