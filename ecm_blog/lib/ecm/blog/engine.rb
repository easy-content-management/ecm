module Ecm
  module Blog
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::Blog
    end
  end
end
