Rails.application.routes.draw do
  mount Ecm::Carousels::Backend::Engine => "/ecm/carousels/backend"
end
