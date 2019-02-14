module Ecm
  module Links
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc 'Copies the locale files to your application'

        source_root File.expand_path('../../../../../../config/locales', __FILE__)

        def generate_locales
          copy_file 'ecm.links.category.en.yml', 'config/locales/ecm.links.category.en.yml'
          copy_file 'ecm.links.category.de.yml', 'config/locales/ecm.links.category.de.yml'
          copy_file 'ecm.links.en.yml', 'config/locales/ecm.links.en.yml'
          copy_file 'ecm.links.de.yml', 'config/locales/ecm.links.de.yml'
          copy_file 'ecm.links.link.en.yml', 'config/locales/ecm.links.link.en.yml'
          copy_file 'ecm.links.link.de.yml', 'config/locales/ecm.links.link.de.yml'
        end
      end
    end
  end
end
