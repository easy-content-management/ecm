module Ecm::Files::Backend
  module Configuration
    def configure
      yield self
    end

    mattr_accessor :registered_controllers do
      lambda do
        [
          Ecm::Files::Backend::FoldersController,
          Ecm::Files::Backend::FileDetailsController
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