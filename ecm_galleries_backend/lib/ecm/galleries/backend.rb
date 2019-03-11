require 'ecm/galleries/backend/configuration'
require "ecm/galleries/backend/engine"

module Ecm
  module Galleries
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:galleries_backend, Ecm::Galleries::Backend) }