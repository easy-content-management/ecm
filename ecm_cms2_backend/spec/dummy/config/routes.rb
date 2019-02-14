Rails.application.routes.draw do
  localized do
    mount Ecm::Cms::Backend::Engine => '/backend/ecm/cms/'
    mount Itsf::Backend::Engine => '/backend'

    Ecm::Cms::Routing.routes(self)
  end

  root to: redirect("/#{I18n.locale}")
end
