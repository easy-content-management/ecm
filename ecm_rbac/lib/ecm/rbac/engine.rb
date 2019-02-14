module Ecm
  module Rbac
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::Rbac
    end
  end
end
