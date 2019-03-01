require 'kaminari'
require 'bootstrap-kaminari-views'
require "delayed_job_active_record"
require "request_store_rails"
require "route_translator"
require "administrador"

require "ecm/core/configuration"
require "ecm/core/engine"

module Ecm
  module Core
    extend Configuration

    module RemoteIp
      extend ActiveSupport::Concern

      class_methods do
        def remote_ip
          RequestLocals.fetch(:remote_ip) { nil }
        end
      end
    end

    include RemoteIp
  end
end
