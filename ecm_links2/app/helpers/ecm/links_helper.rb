module Ecm::LinksHelper
  def render_link_footer(categories = nil, _options = {})
    categories = Ecm::Links::Category.for_link_footer.all if categories.nil?
    grouped_categories = categories.group_by(&:link_footer_column)
    render(partial: 'ecm/links/link_footer', locals: { categories: grouped_categories })
  end
end
