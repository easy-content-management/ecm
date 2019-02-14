require 'factory_girl'

FactoryGirl.definition_file_paths << Ecm::Contact::Engine.root.join(*%w(spec factories))
FactoryGirl.definition_file_paths << Ecm::UserArea::Engine.root.join(*%w(spec factories))

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end