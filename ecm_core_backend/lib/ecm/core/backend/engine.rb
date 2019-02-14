module Ecm
  module Core
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Core::Backend
      end
    end
  end
end