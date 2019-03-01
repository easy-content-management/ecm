module Ecm::Carousels::Backend
  class ItemDetailsController < Ecm::Core::Backend::ResourcesController::Base
    include Rao::ResourcesController::ActsAsListConcern
    include Rao::ResourcesController::SortingConcern

    def self.resource_class
      Ecm::Carousels::ItemDetail
    end

    private

    def load_collection_scope
      super.eager_load(:carousel)
    end

    def permitted_params
      params.require(:item).permit(:carousel_id, :url, :body, :markup_language, :asset)
    end
  end
end
