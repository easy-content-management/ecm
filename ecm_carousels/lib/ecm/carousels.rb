require 'ecm/carousels/engine'
require 'ecm/carousels/configuration'

module Ecm
  module Carousels
    extend Configuration

    def self.table_name_prefix
      'ecm_carousels_'
    end
  end
end

Ecm.configure { |c| c.register_configuration(:carousels, Ecm::Carousels) }