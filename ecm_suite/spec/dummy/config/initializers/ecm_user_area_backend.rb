Ecm::UserArea::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu.
  # 
  # Default: config.resources_controllers = -> {[
  #            Ecm::UserArea::Backend::UsersController
  #          ]}
  # 
  config.resources_controllers = -> {[
    Ecm::UserArea::Backend::UsersController
  ]}

  # Set the services, that will be shown in the backend menu.
  # 
  # Default: config.service_controllers = -> {[
  #            Ecm::UserArea::Backend::CreateDefaultUserServiceController
  #          ]}
  # 
  config.service_controllers = -> {[
    Ecm::UserArea::Backend::CreateDefaultUserServiceController
  ]}

  # Set the sidebars, that will be shown in the backend menu.
  # 
  # Default: config.sidebar_controllers = -> {[
  #            Ecm::UserArea::Backend::UserSidebarsController
  #          ]}
  # 
  config.sidebar_controllers = -> {[
    Ecm::UserArea::Backend::UserSidebarsController
  ]}
end