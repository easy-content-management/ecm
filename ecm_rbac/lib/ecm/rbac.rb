require 'ecm/rbac/configuration'
require 'ecm/rbac/engine'

module Ecm
  module Rbac
    extend Configuration

    def self.table_name_prefix
      'ecm_rbac_'
    end
  end
end

Ecm.configure { |c| c.register_configuration(:rbac, Ecm::Rbac) }