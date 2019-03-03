module Ecm::Carousels::Backend
  class ItemDetailsController < Ecm::Core::Backend::ResourcesController::Base
    include Rao::ResourcesController::ActsAsListConcern
    include Rao::ResourcesController::ActsAsPublishedConcern

    def self.resource_class
      Ecm::Carousels::ItemDetail
    end

    def self.available_rest_actions
      super - %i(new create)
    end

    private

    def load_collection_scope
      super.eager_load(:carousel)
    end

    def permitted_params
      params.require(:item_detail).permit(:carousel_id, :url, :description, :published, :asset)
    end
  end
end
