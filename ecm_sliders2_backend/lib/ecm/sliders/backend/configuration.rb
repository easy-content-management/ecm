module Ecm::Sliders::Backend
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