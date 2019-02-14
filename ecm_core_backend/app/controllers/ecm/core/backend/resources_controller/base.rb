module Ecm
  module Core
    module Backend
      module ResourcesController
        # class Base < Ecm::Core::Backend::Configuration.resources_controller_base_class_name.constantize
        class Base < Administrador::ResourcesController::Base
          # include Administrador::Controller::ApplicationConcern
          # include Administrador::Controller::ResourcesConcern

          # layout 'administrador/application'

          # before_action do
          #   append_view_path ActionView::FileSystemResolver.new(
          #     Administrador::Engine.root.join(*%w(app views)),
          #     "administrador/resources_controller/base/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}"
          #   )
          # end

          # def t(key, options = {})
          # super(key, options)
          #   # if key.start_with?('.')
          #   #   super("administrador.resources_controller.base.index#{key}", options)
          #   # else
          #   #   super(key, options)
          #   # end
          # end

          # helper_method :t
        end
      end
    end
  end
end