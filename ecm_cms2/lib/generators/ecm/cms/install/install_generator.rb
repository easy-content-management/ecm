module Ecm
  module Cms
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the initializer'

        source_root File.expand_path('../templates', __FILE__)

        attr_reader :base_controller_class_name

        def initialize(*args)
          super
          @base_controller_class_name = ENV.fetch('BASE_CONTROLLER_CLASS_NAME') { '::FrontendController' }
        end

        def generate_initializer
          template 'initializer.rb', 'config/initializers/ecm_cms.rb'
        end

        def generate_routes
          inject_into_file 'config/routes.rb', before: "\nend" do
            File.read(File.join(File.expand_path('../templates', __FILE__), 'routes.source'))
          end
        end

        # def add_homepages
        #   if yes? "Do you want to add homepages?"
        #     AddHomepagesService.call
        #   end
        # end
      end
    end
  end
end
