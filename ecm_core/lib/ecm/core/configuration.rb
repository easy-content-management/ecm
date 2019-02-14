require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module Core
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :base_controller do
        '::FrontendController'
      end
    end
  end
end
