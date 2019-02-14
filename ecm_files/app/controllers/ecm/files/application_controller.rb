module Ecm::Files
  class ApplicationController < Ecm::Files::Configuration.base_controller.constantize
    protect_from_forgery with: :exception
  end
end
