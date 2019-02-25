class CreateEcmBlogPosts < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_blog_posts do |t|
      t.string :title
      t.text :body
      t.timestamp :published_at
      t.integer :created_by_id
      t.integer :updated_by_id
      t.string :slug

      t.timestamps null: false

      t.index :slug, unique: true
    end
  end
end
