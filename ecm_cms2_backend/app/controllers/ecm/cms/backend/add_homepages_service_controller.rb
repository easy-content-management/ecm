module Ecm::Cms::Backend
  class AddHomepagesServiceController < Ecm::Core::Backend::ServiceController::Base
    def self.service_class
      Ecm::Cms::AddHomepagesService
    end

    private

    def permitted_params
      params.require(:add_homepages_service).permit(locales: [])
    end
  end
end
