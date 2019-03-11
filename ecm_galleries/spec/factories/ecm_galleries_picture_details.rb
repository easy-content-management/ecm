FactoryBot.define do
  factory :ecm_galleries_picture_detail, class: 'Ecm::Galleries::PictureDetail' do
    association :picture_gallery, factory: :ecm_galleries_picture_gallery
    after(:build) { |resource|
      assets = resource.picture_gallery.assets.attach(
        io:           File.open(File.join(Ecm::Galleries::Engine.root.join(*%w( spec files ecm galleries picture_details example.png)))),
        filename:     'example.png',
        content_type: 'image/png'
      )
      if Rails.version < "6.0.0"
        resource.asset = assets.first
      else
        resource.asset = resource.picture_gallery.assets.first
      end
    }
  end
end
