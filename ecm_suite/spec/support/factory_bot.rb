require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.definition_file_paths << Ecm::Blog::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Cms::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Contact::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Carousels::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Files::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Galleries::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Links::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Rbac::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::Tags::Engine.root.join(*%w(spec factories))
FactoryBot.definition_file_paths << Ecm::UserArea::Engine.root.join(*%w(spec factories))

FactoryBot.find_definitions