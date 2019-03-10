require 'ecm/links/configuration'
require 'ecm/links/engine'

module Ecm
  module Links
    extend Configuration

    def self.table_name_prefix
      'ecm_links_'
    end
  end
end

Ecm.configure { |c| c.register_configuration(:links, Ecm::Links) }