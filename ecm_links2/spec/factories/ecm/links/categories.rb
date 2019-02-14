FactoryGirl.define do
  factory :ecm_links_category, class: Ecm::Links::Category do
    locale I18n.locale
    sequence(:name) { |i| "Link category #{i}" }
    markup_language 'textile'

    factory(:ecm_links_category_with_parent) do
      locale nil
      association :parent, factory: :ecm_links_category
    end

    factory(:ecm_links_category_for_link_footer) do
      link_footer_column 1
    end
  end
end
