require 'ecm/cms/action_view/template/handlers/textile'
require 'ecm/cms/action_view/template_patch'
require 'ecm/cms/action_view/template_renderer_patch'

require 'awesome_nested_set'
require 'rao-service'
require 'redcloth'
require 'simple-navigation'
require 'coffee-rails'

require 'ecm/cms/engine'
require 'ecm/cms/configuration'

require 'ecm/cms/database_template'

require 'ecm/cms/resolvers/ecm/cms/page_resolver'
require 'ecm/cms/resolvers/ecm/cms/template_resolver'
require 'ecm/cms/resolvers/ecm/cms/partial_resolver'

require 'ecm/cms/controller_extensions/page_resolver'
require 'ecm/cms/controller_extensions/partial_resolver'
require 'ecm/cms/controller_extensions/template_resolver'

::ActionView::Template.register_template_handler :textile, ::ActionView::Template::Handlers::Textile.new

module Ecm
  module Cms
    extend Configuration

    def self.table_name_prefix
      'ecm_cms_'
    end
  end
end
