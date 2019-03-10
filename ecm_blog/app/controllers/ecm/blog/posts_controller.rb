module Ecm
  module Blog
    class PostsController < Ecm::Blog::Configuration.base_controller.constantize
      include Rao::ResourcesController::ResourcesConcern
      include Rao::ResourcesController::ResourceInflectionsConcern
      include Rao::ResourcesController::RestResourceUrlsConcern
      include Rao::ResourcesController::RestActionsConcern
      include Rao::ResourcesController::KaminariConcern
      include Rao::ResourcesController::LocationHistoryConcern

      helper Ecm::Comments::ApplicationHelper if Ecm::Blog.features?(:ecm_comments)

      def self.resource_class
        Ecm::Blog::Post
      end

      private

      def load_collection_scope
        if params.has_key?(:year)
          super.published.for_date(params[:year], params[:month], params[:day])
        else
          super.published
        end
      end

      def load_resource_scope
        super.published.friendly
      end
    end
  end
end