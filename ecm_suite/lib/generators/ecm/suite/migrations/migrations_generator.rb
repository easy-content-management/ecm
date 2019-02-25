module Ecm
  module Suite
    module Generators
      class MigrationsGenerator < Rails::Generators::Base
        desc 'Generates the migrations'

        def generate_active_storage_migrations
          `rails active_storage:install:migrations`
        end
        
        def generate_migrations
          %w(blog cms contact files galleries links rbac sliders tags user_area).each do |m|
            `rails ecm_#{m}:install:migrations`
          end
        end
      end
    end
  end
end