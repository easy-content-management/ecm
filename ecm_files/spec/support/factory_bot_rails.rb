require 'factory_bot_rails'

FactoryGirl = FactoryBot

# FactoryBot.definition_file_paths << Ecm::Blorgh::Engine.root.join(*%w(spec factories))
# FactoryBot.factories.clear
# FactoryBot.find_definitions

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
