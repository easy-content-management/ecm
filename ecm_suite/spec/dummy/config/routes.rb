Rails.application.routes.draw do






























  localized do
    mount Ecm::Carousels::Backend::Engine, at: '/backend/ecm-carousels-backend-engine'
  end
  localized do
    mount Ecm::Blog::Backend::Engine, at: '/backend/ecm-blog-backend-engine'
  end
  mount Ecm::Blog::Engine, at: '/'
  mount Ecm::UserArea::Engine, at: '/'
  localized do
    mount Ecm::UserArea::Backend::Engine, at: '/backend/ecm-user-area-backend-engine'
  end
  localized do
    mount Ecm::Tags::Backend::Engine, at: '/backend/ecm-tags-backend-engine'
  end
  localized do
    mount Ecm::Rbac::Backend::Engine, at: '/backend/ecm-rbac-backend-engine'
  end
  localized do
    mount Ecm::Links::Backend::Engine, at: '/backend/ecm-links-backend-engine'
  end
  localized do
    mount Ecm::Galleries::Backend::Engine, at: '/backend/ecm-galleries-backend-engine'
  end
  localized do
    mount Ecm::Files::Backend::Engine, at: '/backend/ecm-files-backend-engine'
  end
  localized do
    mount Ecm::Core::Backend::Engine, at: '/backend/ecm-core-backend-engine'
  end
  localized do
    mount Ecm::Contact::Backend::Engine, at: '/backend/ecm-contact-backend-engine'
  end
  localized do
    mount Ecm::Cms::Backend::Engine, at: '/backend/ecm-cms-backend-engine'
  end
  mount Ecm::Tags::Engine, at: '/'
  mount Ecm::Links::Engine, at: '/'
  mount Ecm::Galleries::Engine, at: '/'
  mount Ecm::Files::Engine, at: '/'
  mount Ecm::Core::Engine, at: '/'
  mount Ecm::Contact::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    mount Administrador::Engine, at: '/administrador-engine'
  end

  mount Ecm::Cms::Engine, at: '/' # This one is greedy and has to go last!

  root to: redirect("/#{I18n.locale}")
end
