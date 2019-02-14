class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_view_path ::Ecm::Cms::TemplateResolver.instance
  prepend_view_path ::Ecm::Cms::PageResolver.instance
  prepend_view_path ::Ecm::Cms::PartialResolver.instance
end
