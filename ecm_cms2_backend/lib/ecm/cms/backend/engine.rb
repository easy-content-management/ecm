module Ecm
  module Cms
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::Cms::Backend

        initializer 'ecm_cms_backend.asset_pipeline' do |app|
          app.config.assets.precompile << 'ecm_cms_backend.js'
          # app.config.assets.precompile << 'ecm_cms_backend.css'
        end
      end
    end
  end
end
