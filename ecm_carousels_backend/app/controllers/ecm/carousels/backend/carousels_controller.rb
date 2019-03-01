module Ecm::Carousels::Backend
  class CarouselsController < Ecm::Core::Backend::ResourcesController::Base
    def self.resource_class
      Ecm::Carousels::Carousel
    end

    private

    def permitted_params
      params.require(:carousel).permit(:identifier, :locale, :height, :width, { assets: [], overwrite_assets: [], append_assets: [] })
    end
  end
end
