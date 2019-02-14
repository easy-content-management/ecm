module Ecm
  module UserArea
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::UserArea
    end
  end
end
