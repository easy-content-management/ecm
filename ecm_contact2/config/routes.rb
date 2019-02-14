Ecm::Contact::Engine.routes.draw do
  localized do
    scope :ecm_contact_engine do
      resources :contact_requests, only: [:create, :index]

      root to: 'contact_requests#index'
    end
  end
end
