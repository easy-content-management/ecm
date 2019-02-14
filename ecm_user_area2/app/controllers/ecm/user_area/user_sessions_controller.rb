module Ecm
  module UserArea
    class UserSessionsController < Ecm::UserArea::Sessions::BaseController
      def self.resource_class
        Ecm::UserArea::UserSession
      end
    end
  end
end