FactoryGirl.define do
  factory :ecm_blog_post, class: Ecm::Blog::Post do
    association(:creator, factory: :ecm_user_area_user)
    sequence(:title) { |i| "Blog post #{i}"}
    body 'This is a blog post!'
  end
end
