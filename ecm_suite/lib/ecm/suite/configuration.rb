module Ecm
  module Suite
    module Configuration
      def configure
        yield self
      end

      def administrador
        Administrador
      end

      def ecm_core
        Ecm::Core
      end

      def ecm_core_backend
        Ecm::Core::Backend
      end
    end
  end
end