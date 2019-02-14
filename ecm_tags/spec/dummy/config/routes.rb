Rails.application.routes.draw do
  resources :posts

  mount Ecm::Tags::Engine, at: '/tags'
end
