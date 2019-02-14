Ecm::Cms::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Cms::Backend::ContentBoxesController,
  #            Ecm::Cms::Backend::NavigationItemsController,
  #            Ecm::Cms::Backend::NavigationsController,
  #            Ecm::Cms::Backend::PagesController,
  #            Ecm::Cms::Backend::PartialsController,
  #            Ecm::Cms::Backend::TemplatesController
  # ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Cms::Backend::ContentBoxesController,
      Ecm::Cms::Backend::NavigationItemsController,
      Ecm::Cms::Backend::NavigationsController,
      Ecm::Cms::Backend::PagesController,
      Ecm::Cms::Backend::PartialsController,
      Ecm::Cms::Backend::TemplatesController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[
  #            Ecm::Cms::AddHomepagesServiceController,
  #            Ecm::Cms::Backend::ImportPartialsServiceController
  #          ]}
  #
  config.registered_services = lambda {
    [
      Ecm::Cms::Backend::AddHomepagesServiceController,
      Ecm::Cms::Backend::ImportPartialsServiceController
    ]
  }
end
