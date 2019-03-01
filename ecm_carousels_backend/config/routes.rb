Ecm::Carousels::Backend::Engine.routes.draw do
  resources :carousels
  resources :item_details do
    post :reposition, on: :member
  end
  
  root to: 'home#index'
end
