require 'ecm/files/configuration'
require "ecm/files/engine"

module Ecm
  module Files
    extend Configuration
  end
end

Ecm.configure { |c| c.register_configuration(:files, Ecm::Files) }