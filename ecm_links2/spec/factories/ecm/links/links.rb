FactoryGirl.define do
  factory :ecm_links_link, class: Ecm::Links::Link do
    sequence(:name) { |i| "Link #{i}" }
    sequence(:url)  { |i| "http://www.example.com/#{i}" }
    markup_language 'textile'
  end
end
