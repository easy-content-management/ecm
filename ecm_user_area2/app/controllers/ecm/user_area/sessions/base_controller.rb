module Ecm
  module UserArea
    module Sessions
      class BaseController < Ecm::UserArea::Configuration.base_controller.constantize
        include Rao::ResourcesController::ResourcesConcern
        include Rao::ResourcesController::ResourceInflectionsConcern
        include Rao::ResourcesController::RestResourceUrlsConcern
        include Rao::ResourcesController::RestActionsConcern
        include Rao::ResourcesController::LocationHistoryConcern

        skip_before_action :authenticate_user!, only: [:new, :create], raise: false
        skip_before_action :store_location, only: [:new, :create]

        def new
          @session = initialize_resource
          respond_with @session
        end

        def create
          @session = resource_class.new(permitted_params)

          if @session.save
            flash[:notice] = I18n.t('messages.success.ecm_user_area.signed_in') unless request.xhr?
            redirect_to(instance_eval(&Configuration.after_sign_in_url))
            return
          else
            render action: :new
          end
        end

        def destroy
          current_session(resource_class.name.demodulize.underscore.to_sym).destroy
          flash[:notice] = I18n.t('messages.success.ecm_user_area.signed_out') unless request.xhr?
          redirect_to after_sign_out_url
        end

        def self.resource_class
          fail 'please define self.session_class in your controller.'
        end

        private

        def permitted_params
          if Rails.version < '5'
            params.require(resource_class.name.demodulize.underscore.tr('/', '_')).permit(:email, :password)
          else
            params.require(resource_class.name.demodulize.underscore.tr('/', '_')).permit(:email, :password).to_h
          end
        end
      end
    end
  end
end