module Ecm::SlidersHelper
  def render_slider(name, options = {})
    slider = Ecm::Sliders::Slider.where(name: name.to_s).for_locale(I18n.locale).first
    if slider.nil?
      return I18n.t('ecm.sliders.slider.warnings.not_found', name: name)
    else
      return render partial: 'ecm/sliders/sliders/slider', locals: { slider: slider }
    end
  end
end
