Ecm::Sliders::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Sliders::Backend::SlidersController,
  #            Ecm::Sliders::Backend::ÎtemsController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Sliders::Backend::SlidersController,
      Ecm::Sliders::Backend::ItemsController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }
end
