module Ecm
  module Carousels
    # Usage:
    #
    #     # app/controllers/application_controller.rb
    #     class ApplicationController < ActionController::Base
    #       view_helper Ecm::Carousels::ApplicationViewHelper, as: :carousels_helper
    #     end
    #
    class ApplicationViewHelper < Rao::ViewHelper::Base
      # Example:
      #
      #     # This will render a bootstrap 4 compatible carousel
      #     = carousels_helper(self).render(:main)
      #
      def render(name, options = {})
        carousel = Ecm::Carousels::Carousel.where(name: name.to_s).for_locale(I18n.locale).first
        if carousel.nil?
          return I18n.t('ecm.carousels.carousel.warnings.not_found', name: name)
        else
          return c.render partial: 'ecm/carousels/application_view_helper/render', locals: { carousel: carousel }
        end
      end
    end
  end
end
