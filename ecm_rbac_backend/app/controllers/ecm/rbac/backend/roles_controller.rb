module Ecm
  module Rbac
    module Backend
      class RolesController < Ecm::Core::Backend::ResourcesController::Base
        def self.resource_class
          Ecm::Rbac::Role
        end

        private

        def permitted_params
          params.require(:role).permit(:identifier, :enabled_from, :enabled_to, permission_ids: [], user_ids: [])
        end
      end
    end
  end
end
