require "ecm/contact/backend/configuration"
require "ecm/contact/backend/engine"

module Ecm
  module Contact
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:contact_backend, Ecm::Contact::Backend) }