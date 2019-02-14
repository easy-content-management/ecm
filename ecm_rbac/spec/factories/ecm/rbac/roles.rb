FactoryGirl.define do
  factory :ecm_rbac_role, class: Ecm::Rbac::Role do
    sequence(:identifier) { |i| "Permission ##{i}" }
  end
end
