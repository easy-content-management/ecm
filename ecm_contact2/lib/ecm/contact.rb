require "ecm/contact/configuration"
require "ecm/contact/engine"

module Ecm
  module Contact
    extend Configuration
  end
end

Ecm.configure { |c| c.register_configuration(:contact, Ecm::Contact) }