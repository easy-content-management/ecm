Rails.application.routes.draw do
  mount Ecm::Contact::Engine, at: '/'
end
