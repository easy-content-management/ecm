FactoryGirl.define do
  factory :ecm_rbac_user_role, class: Ecm::Rbac::UserRole do
    association :user, factory: Ecm::Rbac::Configuration.user_class_name.underscore.gsub('/', '_')
    association :role, factory: :ecm_rbac_role
  end
end
