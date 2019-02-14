require 'ecm/rbac/configuration'

module Ecm
  module Rbac
    extend Configuration

    def self.table_name_prefix
      'ecm_rbac_'
    end
  end
end
