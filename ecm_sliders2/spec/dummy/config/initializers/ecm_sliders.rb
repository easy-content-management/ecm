Ecm::Sliders.configure do |config|
  # Slider options #############################################################
  
  # Autostart
  #
  # default:  config.slider_auto_start = false
  config.slider_auto_start = false

  # Interval
  #
  # default:  config.slider_interval = 5.0
  config.slider_interval = 5.0
  
  # Item options ###############################################################

  # image sizes for slider items
  #
  # default:   config.item_image_styles = {
  #              :small_thumb  => "80x60>",
  #              :medium_thumb => "160x120>",
  #              :slider       => "830x477"
  #            }
  config.item_image_styles = {
    :small_thumb  => "80x60>",
    :medium_thumb => "160x120>",
    :slider       => "830x477"
  }

  # Accepted markup languages for the item body
  #
  # default: config.markup_languages = %w[ markdown rdoc textile ]
  config.markup_languages = %w[ markdown rdoc textile ]

  # Default markup language for the item body
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'
end

