module Ecm
  module UserArea
    class CurrentUsersController < Users::BaseController
      helper Rao::Component::ApplicationHelper

      def self.resource_class
        Ecm::UserArea::User
      end
    end
  end
end