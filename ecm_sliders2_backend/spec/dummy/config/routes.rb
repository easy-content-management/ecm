Rails.application.routes.draw do
  mount Ecm::Sliders::Backend::Engine => "/ecm/sliders/backend"
end
