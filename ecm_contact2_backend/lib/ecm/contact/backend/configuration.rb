require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module Contact
    module Backend
      module Configuration
        def configure
          yield self
        end

        mattr_accessor :registered_controllers do
          lambda do
            [
              # Ecm::Contact::Backend::FoosController
            ]
          end
        end

        mattr_accessor :registered_services do
          lambda do
            []
          end
        end
      end
    end
  end
end
