FactoryGirl.define do
  factory :ecm_sliders_item, class: Ecm::Sliders::Item do
    association :slider, factory: :ecm_sliders_slider
    markup_language 'textile'
    after(:build) { |f| 
      f.image.attach(
        io:           File.open(File.join(Ecm::Sliders::Engine.root.join(*%w( spec files ecm sliders items example.png)))),
        filename:     'example.png',
        content_type: 'image/png'
      )
    }
  end
end

