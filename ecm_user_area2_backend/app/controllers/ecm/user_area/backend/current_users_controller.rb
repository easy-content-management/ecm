module Ecm
  module UserArea
    module Backend
      class CurrentUsersController < Itsf::Backend::Resource::BaseController
        def self.resource_class
          Ecm::UserArea::User
        end

        def show
          @resource = current_user
          respond_with @resource
        end

        private

        def permitted_params
          params.require(:user).permit()
        end
      end
    end
  end
end