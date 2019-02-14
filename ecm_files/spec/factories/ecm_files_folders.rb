FactoryBot.define do
  factory :ecm_files_folder, class: 'Ecm::Files::Folder' do
    sequence(:name) { |i| "Folder ##{i}" }
  end
end
