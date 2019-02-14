Rails.application.routes.draw do
  mount Ecm::UserArea::Engine, at: '/'

  localized do
    get '/', to: 'home#index'
  end

  root to: redirect("/#{I18n.locale}")
end
