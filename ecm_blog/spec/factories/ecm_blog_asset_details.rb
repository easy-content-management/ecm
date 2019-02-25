FactoryGirl.define do
  factory :ecm_blog_asset_detail, class: Ecm::Blog::AssetDetail do
    association(:post, factory: :ecm_blog_post)
    after(:build) { |ad| 
      assets = ad.post.assets.attach(
        io:           File.open(File.join(Ecm::Blog::Engine.root.join(*%w( spec files ecm blog asset example.jpg)))),
        filename:     'example.jpg',
        content_type: 'image/jpeg'
      )
      ad.asset = assets.first
    }
  end
end
