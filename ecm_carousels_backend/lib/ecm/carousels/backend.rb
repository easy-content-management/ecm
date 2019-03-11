require 'ecm/carousels/backend/configuration'
require "ecm/carousels/backend/engine"

module Ecm
  module Carousels
    module Backend
      # Your code goes here...
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:carousels_backend, Ecm::Carousels::Backend) }