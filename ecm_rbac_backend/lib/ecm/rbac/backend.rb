require 'ecm/rbac/backend/configuration'
require 'ecm/rbac/backend/engine'

module Ecm
  module Rbac
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:rbac_backend, Ecm::Rbac::Backend) }