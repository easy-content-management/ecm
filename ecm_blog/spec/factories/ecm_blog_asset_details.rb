FactoryBot.define do
  factory :ecm_blog_asset_detail, class: Ecm::Blog::AssetDetail do
    association(:post, factory: :ecm_blog_post)
    after(:build) { |resource| 
      assets = resource.post.assets.attach(
        io:           File.open(File.join(Ecm::Blog::Engine.root.join(*%w( spec files ecm blog asset example.jpg)))),
        filename:     'example.jpg',
        content_type: 'image/jpeg'
      )
      if Rails.version < "6.0.0"
        resource.asset = assets.first
      else
        resource.asset = resource.post.assets.all.first
      end
    }
  end
end
