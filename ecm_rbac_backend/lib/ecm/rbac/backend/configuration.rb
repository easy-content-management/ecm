require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module Rbac
    module Backend
      module Configuration
        def configure
          yield self
        end

        mattr_accessor :registered_controllers do
          -> { [] }
        end

        mattr_accessor :registered_services do
          -> { [] }
        end
      end
    end
  end
end
