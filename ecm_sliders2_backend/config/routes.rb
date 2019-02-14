Ecm::Sliders::Backend::Engine.routes.draw do
  resources :sliders
  resources :items do
    post :reposition, on: :member
  end
  
  root to: 'home#index'
end
