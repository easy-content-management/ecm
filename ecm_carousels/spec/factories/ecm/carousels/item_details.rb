FactoryBot.define do
  factory :ecm_carousels_item_detail, class: Ecm::Carousels::ItemDetail do
    association :carousel, factory: :ecm_carousels_carousel
    after(:build) { |resource|
      assets = resource.carousel.assets.attach(
        io:           File.open(Ecm::Carousels::Engine.root.join(*%w( spec files ecm carousels item_details example.png))),
        filename:     'example.png',
        content_type: 'image/png'
      )
      if Rails.version < "6.0.0"
        resource.asset = assets.first
      else
        resource.asset = resource.carousel.assets.first
      end
    }
  end
end

