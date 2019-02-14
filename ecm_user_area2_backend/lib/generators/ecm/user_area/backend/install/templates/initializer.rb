Ecm::UserArea::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu.
  # 
  # Default: config.registered_controllers = -> {[
  #            Ecm::UserArea::Backend::UsersController
  #          ]}
  # 
  config.registered_controllers = -> {[
    Ecm::UserArea::Backend::UsersController
  ]}

  # Set the services, that will be shown in the backend menu.
  # 
  # Default: config.registered_services = -> {[
  #            Ecm::UserArea::Backend::CreateDefaultUserServiceController
  #          ]}
  # 
  config.registered_services = -> {[
    Ecm::UserArea::Backend::CreateDefaultUserServiceController
  ]}
end