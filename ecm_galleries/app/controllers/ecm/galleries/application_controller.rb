module Ecm::Galleries
  class ApplicationController < Ecm::Galleries::Configuration.base_controller.constantize
    protect_from_forgery with: :exception
  end
end
