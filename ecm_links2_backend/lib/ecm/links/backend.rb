require 'ecm/links/backend/configuration'
require 'ecm/links/backend/engine'

module Ecm
  module Links
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:links_backend, Ecm::Links::Backend) }