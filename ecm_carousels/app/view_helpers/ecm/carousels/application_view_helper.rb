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
      #     = carousels_helper(self).render(:main, autostart: true, interval: 5.0, variant_options: { resize: "1920x1080" })
      #
      def render(identifier, options = {})
        options.reverse_merge!(autostart: true, interval: 5.0, keyboard: true, pause: :hover, ride: false, wrap: true, controls: true)
        carousel_options = options.slice(:autostart, :interval, :pause, :ride, :wrap)
        data_attributes = carousel_options_to_data_attributes(carousel_options)

        carousel = Ecm::Carousels::Carousel.where(identifier: identifier.to_s).for_locale(I18n.locale).first

        if carousel.nil?
          return I18n.t('ecm.carousels.carousel.warnings.not_found', identifier: identifier)
        else
          variant_options = options.delete(:variant_options) || carousel.variant_options
          return c.render partial: 'ecm/carousels/application_view_helper/render', locals: { carousel: carousel, options: options, data_attributes: data_attributes, variant_options: variant_options }
        end
      end

      private

      def carousel_options_to_data_attributes(carousel_options)
        carousel_options.collect { |k,v| "\"data-#{k.to_s.dasherize}\"=#{v}" }.join(" ")
      end
    end
  end
end
