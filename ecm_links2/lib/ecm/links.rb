require 'ecm/links/configuration'

module Ecm
  module Links
    extend Configuration

    def self.table_name_prefix
      'ecm_links_'
    end
  end
end
