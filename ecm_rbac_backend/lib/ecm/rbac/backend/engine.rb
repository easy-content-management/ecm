module Ecm
  module Rbac
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Rbac::Backend
      end
    end
  end
end
