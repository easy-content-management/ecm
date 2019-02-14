FactoryGirl.define do
  factory :ecm_rbac_permission, class: Ecm::Rbac::Permission do
    sequence(:identifier) { |i| "Permission ##{i}" }
  end
end
