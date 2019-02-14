Rails.application.routes.draw do
  mount Ecm::Galleries::Backend::Engine => "/ecm/galleries/backend"
end
