module Ecm
  module Links
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Links::Backend

        initializer 'ecm_links_backend.asset_pipeline' do |app|
          app.config.assets.precompile << 'ecm_links_backend.js'
          app.config.assets.precompile << 'ecm_links_backend.css'
        end
      end
    end
  end
end
