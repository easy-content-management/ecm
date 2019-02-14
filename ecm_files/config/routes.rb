Ecm::Files::Engine.routes.draw do
  localized do
    scope :ecm_files_engine do
      resources :folders
    end
  end
end
