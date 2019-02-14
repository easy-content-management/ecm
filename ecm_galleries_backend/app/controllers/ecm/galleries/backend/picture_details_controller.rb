module Ecm
  module Galleries
    module Backend
      class PictureDetailsController < Ecm::Core::Backend::ResourcesController::Base
        # include Rao::ResourcesController::SortingConcern
        # include Rao::ResourcesController::BatchActionsConcern
        # include Rao::ResourcesController::ActsAsListConcern
        # include Rao::ResourcesController::ActsAsPublishedConcern
        # include Rao::Query::Controller::QueryConcern

        helper Twitter::Bootstrap::Components::Rails::V4::ComponentsHelper

        def self.resource_class
          Ecm::Galleries::PictureDetail
        end

        def self.available_rest_actions
          super - %i(new)
        end

        private

        def load_collection_scope
          scope = super.joins(:picture_gallery).order(picture_gallery_id: :asc, position: :asc)
          with_conditions_from_query(scope)
        end

        def after_destroy_location
          last_location
        end

        def permitted_params
          params.require(:picture_detail).permit(:title, :description, :picture_gallery_id, :published)
        end
      end
    end
  end
end
