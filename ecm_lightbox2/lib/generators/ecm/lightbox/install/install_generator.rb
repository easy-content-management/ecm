module Ecm
  module Lightbox
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the initializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "ecm_lightbox.rb", "config/initializers/ecm_lightbox.rb"
        end   
      end
    end
  end
end        
