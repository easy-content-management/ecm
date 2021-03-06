module Ecm
  module Core
    module Backend
      module ActiveStorage
        class BlobsController < Ecm::Core::Backend::ResourcesController::Base
          def self.resource_class
            ::ActiveStorage::Blob
          end

          private

          def permitted_params
            params.require(:blob).permit()
          end
        end
      end
    end
  end
end