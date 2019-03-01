class ApplicationController < ActionController::Base
  # From ECM Tags
  helper Ecm::Tags::ApplicationHelper
  
  include Ecm::UserArea::Controller::RedirectBackConcern
  include Ecm::UserArea::Controller::CurrentUserConcern

end
