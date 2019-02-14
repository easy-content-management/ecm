module Ecm
  module Suite
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::Suite
    end
  end
end