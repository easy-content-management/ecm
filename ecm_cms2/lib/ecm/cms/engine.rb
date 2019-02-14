module Ecm
  module Cms
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::Cms
      
      config.app_generators do |c|
        c.test_framework :rspec, fixture: true,
                                 fixture_replacement: nil

        c.integration_tool :rspec
        c.performance_tool :rspec
      end
    end
  end
end
