module Ecm
  module UserArea
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::UserArea::Backend

        initializer "ecm_user_area_backend.asset_pipeline" do |app|
          app.config.assets.precompile << 'ecm_user_area_backend.js'
          app.config.assets.precompile << 'ecm_user_area_backend.css'
        end
      end
    end
  end
end
