class CreateEcmBlogAssetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :ecm_blog_asset_details do |t|
      t.references :post
      t.references :asset
      t.string :title
      t.text :description
      t.integer :position
      t.timestamp :published_at

      t.timestamps
    end
  end
end
