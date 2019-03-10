require 'ecm/blog/feature'
require 'ecm/blog/configuration'
require 'ecm/blog/engine'


module Ecm
  module Blog
    extend Configuration
  end
end

Ecm.configure { |c| c.register_configuration(:blog, Ecm::Blog) }
