FactoryBot.define do
  factory :ecm_galleries_picture_gallery, class: 'Ecm::Galleries::PictureGallery' do
    sequence(:name)  { |i| "Picture Gallery ##{i}" }
  end
end
