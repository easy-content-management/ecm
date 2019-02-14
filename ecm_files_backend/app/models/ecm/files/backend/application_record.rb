module Ecm::Files::Backend
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
