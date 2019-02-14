Rails.application.routes.draw do
  mount Ecm::Files::Engine, at: '/'
end
