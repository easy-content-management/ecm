module Ecm
  module Links
    module Backend
      class CategoriesController < Ecm::Core::Backend::ResourcesController::Base
        def self.resource_class
          Ecm::Links::Category
        end

        private

        def permitted_params
          params
            .require(:category)
            .permit(:parent_id, :locale, :name, :markup_language, :short_description, :long_description, :link_footer_column)
        end
      end
    end
  end
end