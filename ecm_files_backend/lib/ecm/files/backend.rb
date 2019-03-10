require 'ecm/files/backend/configuration'
require "ecm/files/backend/engine"

module Ecm
  module Files
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:files_backend, Ecm::Files::Backend) }