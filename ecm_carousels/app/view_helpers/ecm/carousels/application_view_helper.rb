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
      def render(identifier, options = {})
        options.reverse_merge!(autostart: true, interval: 5.0)
        carousel_options = options.slice(:autostart, :interval)

        carousel = Ecm::Carousels::Carousel.where(identifier: identifier.to_s).for_locale(I18n.locale).first
        if carousel.nil?
          return I18n.t('ecm.carousels.carousel.warnings.not_found', identifier: identifier)
        else
          return c.render partial: 'ecm/carousels/application_view_helper/render', locals: { carousel: carousel, options: carousel_options }
        end
      end
    end
  end
end
