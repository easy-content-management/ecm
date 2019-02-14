# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_user_area_user, class: 'Ecm::UserArea::User' do
    sequence(:email) { |n| "user#{n}@example.com" }
    password              'password'
    password_confirmation 'password'

    trait :authenticable do
      active    true
      confirmed true
      approved  true
    end
  end
end
