require 'ecm/cms/backend/configuration'
require 'ecm/cms/backend/engine'

module Ecm
  module Cms
    module Backend
      extend Configuration
    end
  end
end

Ecm.configure { |c| c.register_configuration(:cms_backend, Ecm::Cms::Backend) }