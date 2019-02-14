module Ecm
  module Core
    module Backend
      module ServiceController
        class Base < Administrador::ServiceController::Base
        # class Base < Ecm::Core::Backend::Configuration.service_controller_base_class_name.constantize
        #   include Administrador::Controller::ApplicationConcern
        #   include Administrador::Controller::ServiceConcern
        end
      end
    end
  end
end