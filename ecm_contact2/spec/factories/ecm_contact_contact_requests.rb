FactoryBot.define do
  factory :ecm_contact_contact_request, class: 'Ecm::Contact::ContactRequest' do
    name { "John Doe" }
    email { "john.doe@example.com" }
    phone { "+491234567890" }
    ip_address { "127.0.0.1" }
    message { "Please callback!" }
    accept_terms_of_service { true }
  end
end
