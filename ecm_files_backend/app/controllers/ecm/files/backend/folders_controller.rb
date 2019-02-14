module Ecm
  module Files
    module Backend
      class FoldersController < Ecm::Core::Backend::ResourcesController::Base
        include Rao::ResourcesController::ActsAsPublishedConcern

        def self.resource_class
          Ecm::Files::Folder
        end

        private

        def permitted_params
          params.require(:folder).permit(:name, :description, :published, assets: [])
        end
      end
    end
  end
end
