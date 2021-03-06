module Ecm
  module Contact
    module Backend
      class ContactRequestsController < Ecm::Core::Backend::ResourcesController::Base
        def self.resource_class
          Ecm::Contact::ContactRequest
        end

        def self.available_rest_actions
          super - %i(new create)
        end

        private

        def permitted_params
          params.require(:contact_request).permit(:name, :email, :phone, :ip_address, :message, :nickname, :accept_terms_of_service)
        end

        def collection_scope
          super.order(created_at: :desc)
        end

        module Notification
          def notify
            @resource = load_resource
            @resource.notify
            redirect_back fallback_location: { action: :index }, notice: t('.success')
          end
        end

        include Notification
      end
    end
  end
end
