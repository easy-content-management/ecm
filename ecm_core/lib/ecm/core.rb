require "ecm/core/configuration"
require "ecm/core/engine"

module Ecm
  module Core
    extend Configuration

    module RemoteIpConcern
      extend ActiveSupport::Concern

      class_methods do
        def remote_ip
          RequestLocals.fetch(:remote_ip) { nil }
        end
      end
    end

    include RemoteIpConcern
  end
end

Ecm.configure { |c| c.register_configuration(:core, Ecm::Core) }