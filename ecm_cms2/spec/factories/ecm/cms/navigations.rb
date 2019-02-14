FactoryGirl.define do
  factory :ecm_cms_navigation, class: Ecm::Cms::Navigation do
    sequence(:name) { |i| "Navigation ##{i}" }
    locale I18n.locale
  end
end
