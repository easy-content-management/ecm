module Ecm
  module Blog
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Blog::Backend
      end
    
    end
  end
end



