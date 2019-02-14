module Ecm::Sliders::Backend
  class SlidersController < Ecm::Core::Backend::ResourcesController::Base
    def self.resource_class
      Ecm::Sliders::Slider
    end

    private

    def load_resource_scope
      super.friendly
    end

    def permitted_params
      params.require(:slider).permit(:locale, :name, :description, :auto_start, :interval)
    end
  end
end
