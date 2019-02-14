module Ecm
  module Tags
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Tags::Backend
      end
    end
  end
end
