module Ecm
  module Sliders
    # Usage:
    #
    #     # app/controllers/application_controller.rb
    #     class ApplicationController < ActionController::Base
    #       view_helper Ecm::Sliders::ApplicationViewHelper, as: :sliders_helper
    #     end
    #
    class ApplicationViewHelper < Rao::ViewHelper::Base
      # Example:
      #
      #     # This will render a bootstrap 4 compatible carousel
      #     = sliders_helper(self).render(:main)
      #
      def render(name, options = {})
        slider = Ecm::Sliders::Slider.where(name: name.to_s).for_locale(I18n.locale).first
        if slider.nil?
          return I18n.t('ecm.sliders.slider.warnings.not_found', name: name)
        else
          return c.render partial: 'ecm/sliders/application_view_helper/render', locals: { slider: slider }
        end
      end
    end
  end
end
