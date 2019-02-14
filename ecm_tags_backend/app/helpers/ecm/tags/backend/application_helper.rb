module Ecm
  module Tags
    module Backend
      module ApplicationHelper
        def tag_toolbar(options = {})
          render 'ecm/tags/backend/tag_toolbar'
        end

        def tag_labels_for(resource)
          render 'ecm/tags/backend/tag_labels_for_resource', resource: resource
        end
      end
    end
  end
end
