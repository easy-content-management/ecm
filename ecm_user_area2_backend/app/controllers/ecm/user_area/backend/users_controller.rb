module Ecm
  module UserArea
    module Backend
      class UsersController < Ecm::Core::Backend::ResourcesController::Base
        include Rao::ResourcesController::SortingConcern

        def self.resource_class
          Ecm::UserArea::User
        end

        def autocomplete
          @collection = collection_scope.autocomplete(params[:term])

          respond_to do |format|
            format.json { render json: @collection.map { |q| q.as_json(style: :autocomplete) } }
          end
        end

        private
        
        def permitted_params
          params
            .require(:user)
              .permit(:email, :password, :password_confirmation, :active, :confirmed, :approved)
        end
      end
    end
  end
end
