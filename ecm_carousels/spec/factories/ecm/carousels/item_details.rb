FactoryBot.define do
  factory :ecm_carousels_item_detail, class: Ecm::Carousels::ItemDetail do
    association :carousel, factory: :ecm_carousels_carousel
    after(:build) { |f| 
      f.asset.attach(
        io:           File.open(Ecm::Carousels::Engine.root.join(*%w( spec files ecm carousels item_details example.png))),
        filename:     'example.png',
        content_type: 'image/png'
      )
    }
  end
end

