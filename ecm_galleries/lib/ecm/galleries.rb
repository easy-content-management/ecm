require 'ecm/galleries/configuration'
require "ecm/galleries/engine"

module Ecm
  module Galleries
    extend Configuration
  end
end

Ecm.configure { |c| c.register_configuration(:galleries, Ecm::Galleries) }
