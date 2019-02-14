module Ecm::Files
  class ApplicationResourcesController < Ecm::Blog::Configuration.base_controller.constantize
    include Rao::ResourcesController::RestActionsConcern
    include Rao::ResourcesController::ResourcesConcern
    include Rao::ResourcesController::RestResourceUrlsConcern
    include Rao::ResourcesController::ResourceInflectionsConcern
    include Rao::ResourcesController::LocationHistoryConcern
    include Rao::Controller::QueryConditionsConcern

    helper Twitter::Bootstrap::Components::Rails::V4::ComponentsHelper

    private

    def load_collection_scope
      add_conditions_from_query(resource_class)
    end
  end
end
