module Ecm
  module Core
    class HomeController < Ecm::Core::Configuration.base_controller.constantize

      def index
        render plain: 'Welcome!'
      end
    end
  end
end
