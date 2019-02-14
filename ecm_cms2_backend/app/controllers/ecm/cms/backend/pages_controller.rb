class Ecm::Cms::Backend::PagesController < Ecm::Core::Backend::ResourcesController::Base
  def self.resource_class
    Ecm::Cms::Page
  end

  private

  def permitted_params
    params.require(:page)
          .permit(:title, :meta_description, :body, :pathname, :basename, :locale, :format, :handler, :layout, ecm_cms_navigation_item_ids: [])
  end
end
