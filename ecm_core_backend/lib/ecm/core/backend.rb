require "ecm/core/backend/configuration"
require "ecm/core/backend/engine"

module Ecm
  module Core
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:core_backend, Ecm::Core::Backend) }