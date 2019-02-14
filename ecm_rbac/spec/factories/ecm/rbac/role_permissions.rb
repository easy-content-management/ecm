FactoryGirl.define do
  factory :ecm_rbac_role_permission, class: Ecm::Rbac::RolePermission do
    association :role,       factory: :ecm_rbac_role
    association :permission, factory: :ecm_rbac_permission
  end
end
