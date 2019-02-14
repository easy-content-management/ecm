Ecm::Galleries::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu.
  # 
  # Default: config.registered_controllers = -> {[
  #            Ecm::Galleries::Backend::PictureGalleriesController,
  #            Ecm::Galleries::Backend::PictureDetailsController
  #          ]}
  # 
  config.registered_controllers = -> {[
    Ecm::Galleries::Backend::PictureGalleriesController,
    Ecm::Galleries::Backend::PictureDetailsController
  ]}

  # Set the services, that will be shown in the backend menu.
  # 
  # Default: config.registered_services = -> {[
  #          ]}
  # 
  config.registered_services = -> {[
  ]}
end