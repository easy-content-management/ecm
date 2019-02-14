module Ecm
  module Core
    module Backend
      module ActiveStorage
        class AttachmentsController < Ecm::Core::Backend::ResourcesController::Base
          def self.resource_class
            ::ActiveStorage::Attachment
          end

          private

          def permitted_params
            params.require(:attachment).permit()
          end
        end
      end
    end
  end
end