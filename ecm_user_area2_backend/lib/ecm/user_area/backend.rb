require 'ecm/user_area/backend/configuration'
require 'ecm/user_area/backend/engine'

module Ecm
  module UserArea
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:user_area_backend, Ecm::UserArea::Backend) }