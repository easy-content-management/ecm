require 'ecm/cms/action_view/template_patch'
require 'ecm/cms/action_view/template_renderer_patch'

require 'ecm/cms/engine'
require 'ecm/cms/configuration'

require 'ecm/cms/database_template'

require 'ecm/cms/controller_extensions/page_resolver'
require 'ecm/cms/controller_extensions/partial_resolver'
require 'ecm/cms/controller_extensions/template_resolver'

module Ecm
  module Cms
    extend Configuration

    def self.table_name_prefix
      'ecm_cms_'
    end
  end
end

Ecm.configure { |c| c.register_configuration(:cms, Ecm::Cms) }