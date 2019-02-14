FactoryGirl.define do
  factory :ecm_tags_tag, class: Ecm::Tags::Tag do
    sequence(:name) { |i| "tag-name-#{i}" }
  end
end

