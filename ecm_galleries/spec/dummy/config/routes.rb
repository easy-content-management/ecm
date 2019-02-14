Rails.application.routes.draw do
  mount Ecm::Galleries::Engine, at: '/'
end
