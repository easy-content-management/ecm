FactoryBot.define do
  factory :ecm_tags_tagging, class: Ecm::Tags::Tagging do
    association :tag, factory: :ecm_tags_tag, strategy: :create
    context { 'tags' }
  end
end
