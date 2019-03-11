require 'ecm/tags/configuration'
require 'ecm/tags/engine'

module Ecm
  module Tags
    extend Configuration
  end
end

Ecm.configure { |c| c.register_configuration(:tags, Ecm::Tags) }