class Ecm::Cms::Backend::NavigationItemsController < Ecm::Core::Backend::ResourcesController::Base
  include Rao::ResourcesController::AwesomeNestedSetConcern

  def self.resource_class
    Ecm::Cms::NavigationItem
  end

  private

  def load_collection_scope
    super.joins(:ecm_cms_navigation).includes(:ecm_cms_page)
  end

  def permitted_params
    params.require(:navigation_item)
          .permit(:ecm_cms_navigation_id, :ecm_cms_page_id, :highlights_on, :key, :name, :parent_id, :options, :url, *Ecm::Cms::Configuration.navigation_item_properties)
  end
end
