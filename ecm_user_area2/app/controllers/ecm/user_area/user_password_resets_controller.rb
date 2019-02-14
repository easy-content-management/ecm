module Ecm
  module UserArea
    class UserPasswordResetsController < PasswordResets::BaseController
      def self.resource_class
        Ecm::UserArea::User
      end
    end
  end
end