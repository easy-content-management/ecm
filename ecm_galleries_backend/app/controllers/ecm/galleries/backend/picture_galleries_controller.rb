module Ecm
  module Galleries
    module Backend
      class PictureGalleriesController < Ecm::Core::Backend::ResourcesController::Base
        include Rao::ResourcesController::ActsAsPublishedConcern

        helper Twitter::Bootstrap::Components::Rails::V4::ComponentsHelper

        def self.resource_class
          Ecm::Galleries::PictureGallery
        end

        private

        def permitted_params
          params.require(:picture_gallery).permit(:name, :description, :published, { assets: [], overwrite_assets: [], append_assets: [] })
        end
      end
    end
  end
end
