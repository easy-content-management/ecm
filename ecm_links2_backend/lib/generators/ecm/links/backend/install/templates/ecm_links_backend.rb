Ecm::Links::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu in development
  # mode. This needs to be set to get a correct menu because
  # Controller.descendants is empty in development. This is an eager load
  # issue.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Links::Backend::CategoriesController,
  #            Ecm::Links::Backend::LinksController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Links::Backend::CategoriesController,
      Ecm::Links::Backend::LinksController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }
end
