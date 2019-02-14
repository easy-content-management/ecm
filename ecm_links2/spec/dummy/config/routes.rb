Rails.application.routes.draw do
  Ecm::Links::Routing.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
