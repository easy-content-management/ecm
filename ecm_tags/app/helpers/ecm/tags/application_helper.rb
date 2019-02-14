module Ecm
  module Tags
    module ApplicationHelper
      def tags_search_box
        @tag_search ||= Ecm::Tags::TagSearch.new
        render partial: 'ecm/tags/search_box'
      end

      def tag_labels_for(resource)
        render 'ecm/tags/tag_labels_for_resource', resource: resource
      end
    end
  end
end
