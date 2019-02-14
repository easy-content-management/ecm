Ecm::Cms::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu in development
  # mode. This needs to be set to get a correct menu because
  # Controller.descendants is empty in development. This is an eager load
  # issue.
  #
  # Default: config.registered_controllers = []
  #
  config.registered_controllers = proc {
    [
      Ecm::Cms::Backend::ContentBoxesController,
      Ecm::Cms::Backend::NavigationItemsController,
      Ecm::Cms::Backend::NavigationsController,
      Ecm::Cms::Backend::PagesController,
      Ecm::Cms::Backend::PartialsController,
      Ecm::Cms::Backend::TemplatesController
    ]
  }
end
