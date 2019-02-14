Ecm::Suite.configure do |config|
  config.administrador.register_engine 'Ecm::Cms::Backend::Engine',       {}
  config.administrador.register_engine 'Ecm::Contact::Backend::Engine',   {}
  config.administrador.register_engine 'Ecm::Core::Backend::Engine',      {}
  config.administrador.register_engine 'Ecm::Files::Backend::Engine',     {}
  config.administrador.register_engine 'Ecm::Galleries::Backend::Engine', {}
  config.administrador.register_engine 'Ecm::Links::Backend::Engine',     {}
  config.administrador.register_engine 'Ecm::Rbac::Backend::Engine',      {}
  config.administrador.register_engine 'Ecm::Sliders::Backend::Engine',   {}
  config.administrador.register_engine 'Ecm::UserArea::Backend::Engine',  {}

  config.administrador.enable_feature :kaminari, {}
  config.administrador.enable_feature :rao_query, {}

  config.ecm_core_backend.resources_controller_base_class_name = '::BackendController'
  config.ecm_core_backend.service_controller_base_class_name   = '::BackendController'
  config.ecm_core_backend.home_controller_base_class_name      = '::BackendController'
end
