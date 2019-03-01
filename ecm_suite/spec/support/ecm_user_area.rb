require 'ecm/user_area/spec_helpers/feature'

RSpec.configure do |config|
  config.include Ecm::UserArea::SpecHelpers::Feature, type: :feature
  config.include Ecm::UserArea::SpecHelpers::Feature, type: :system
end