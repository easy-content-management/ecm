FactoryBot.define do
  factory :ecm_files_file_detail, class: 'Ecm::Files::FileDetail' do
    association :folder, factory: :ecm_files_folder
    after(:build) { |f| 
      assets = f.folder.assets.attach(
        io:           File.open(File.join(Ecm::Files::Engine.root.join(*%w( spec files ecm files file_details example.png)))),
        filename:     'example.png',
        content_type: 'image/png'
      )
      f.asset = assets.first
    }
  end
end
