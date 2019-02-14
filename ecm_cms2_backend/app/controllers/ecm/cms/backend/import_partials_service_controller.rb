module Ecm::Cms::Backend
  class ImportPartialsServiceController < Ecm::Core::Backend::ServiceController::Base
    def self.service_class
      Ecm::Cms::ImportPartialsService
    end

    private

    def permitted_params
      params.fetch(:import_partials_service, {}).permit
    end
  end
end
