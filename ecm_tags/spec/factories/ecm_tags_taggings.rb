FactoryGirl.define do
  factory :ecm_tags_tagging, class: Ecm::Tags::Tagging do
    association :tag, factory: :ecm_tags_tag
    context 'tags'
  end
end
