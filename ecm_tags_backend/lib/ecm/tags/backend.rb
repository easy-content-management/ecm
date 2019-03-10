require 'ecm/tags/backend/configuration'
require 'ecm/tags/backend/engine'

module Ecm
  module Tags
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:tags_backend, Ecm::Tags::Backend) }
