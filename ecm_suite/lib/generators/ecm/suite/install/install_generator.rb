require 'rake'

module Ecm
  module Suite
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the initializer'

        source_root File.expand_path('../templates', __FILE__)

        def initialize(*args)
          ENV['ECM_RBAC_USER_CLASS_NAME'] ||= 'Ecm::UserArea::User'
          super
        end

        def run_dependency_generators
          generate "administrador:install"
          generate "simple_form:install --bootstrap"
        end

        def generate_route_translator_config
           template 'config/initializers/route_translator.rb', 'config/initializers/route_translator.rb'
        end

        def generate_initializer
          copy_file 'config/initializers/ecm_suite.rb', 'config/initializers/ecm_suite.rb'
        end

        def run_frontend_generators
          %w(blog core cms contact files galleries lightbox links rbac sliders tags).each do |m|
            generate "ecm:#{m}:install"
          end
        end
        
        def run_backend_generators
          %w(blog core cms contact files galleries links rbac sliders tags user_area).each do |m|
            generate "ecm:#{m}:backend:install"
          end
        end

        def run_migrations_generator
          generate "ecm:suite:migrations"
        end

        # def generate_active_storage_migrations
        #   `rails active_storage:install:migrations`
        # end
        
        # def generate_migrations
        #   Rails.application.load_tasks # <-- MISSING LINE
        #   %w(cms contact files galleries links rbac sliders tags user_area).each do |m|
        #     `rails ecm_#{m}:install:migrations`
        #   end
        # end
      end
    end
  end
end