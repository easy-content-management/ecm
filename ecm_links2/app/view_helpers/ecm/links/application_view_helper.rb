module Ecm
  module Links
    class ApplicationViewHelper < Rao::ViewHelper::Base
      def render_footer(categories = nil, _options = {})
        categories = categories || Ecm::Links::Category.for_link_footer.all
        grouped_categories = categories.group_by(&:link_footer_column)
        c.render partial: 'ecm/links/application_view_helper/render_footer', locals: { categories: grouped_categories }
      end
    end
  end
end
