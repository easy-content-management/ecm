module Ecm::Sliders::Backend
  class ItemsController < Ecm::Core::Backend::ResourcesController::Base
    include Rao::ResourcesController::ActsAsListConcern
    include Rao::ResourcesController::SortingConcern

    def self.resource_class
      Ecm::Sliders::Item
    end

    private

    def load_collection_scope
      super.eager_load(:slider)
    end

    def permitted_params
      params.require(:item).permit(:slider_id, :url, :body, :markup_language, :image)
    end
  end
end
