require 'ecm/user_area/configuration'
require 'ecm/user_area/engine'

module Ecm
  module UserArea
    extend Configuration

    def self.table_name_prefix
      'ecm_user_area_'
    end

    module CurrentUserConcern
      extend ActiveSupport::Concern

      class_methods do
        def current_user_id
          RequestLocals.fetch(:current_user_id) { nil }
        end

        def current_user
          RequestLocals.fetch(:current_user) { nil }
        end
      end
    end

    include CurrentUserConcern
  end
end

Ecm.configure { |c| c.register_configuration(:user_area, Ecm::UserArea) }