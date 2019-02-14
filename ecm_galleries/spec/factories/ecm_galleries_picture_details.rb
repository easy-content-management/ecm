FactoryBot.define do
  factory :ecm_galleries_picture_detail, class: 'Ecm::Galleries::PictureDetail' do
    association :picture_gallery, factory: :ecm_galleries_picture_gallery
    after(:build) { |f|
      assets = f.picture_gallery.assets.attach(
        io:           File.open(File.join(Ecm::Galleries::Engine.root.join(*%w( spec files ecm galleries picture_details example.png)))),
        filename:     'example.png',
        content_type: 'image/png'
      )
      f.asset = assets.first
    }
  end
end
