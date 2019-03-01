FactoryBot.define do
  factory :ecm_carousels_carousel, :class => Ecm::Carousels::Carousel do
    sequence(:identifier) { |i| "carousel_#{i}" }

    factory :ecm_carousels_carousel_with_items do |carousel|
      carousel.after_create { |s| FactoryBot.create_list(:ecm_carousels_item, 5, ecm_carousels_carousel: s) }
    end
  end
end

