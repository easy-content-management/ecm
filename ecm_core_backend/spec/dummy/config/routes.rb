Rails.application.routes.draw do
  mount Ecm::Core::Engine => "/ecm-core"
end
