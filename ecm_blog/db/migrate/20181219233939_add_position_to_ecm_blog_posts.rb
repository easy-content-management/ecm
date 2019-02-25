class AddPositionToEcmBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :ecm_blog_posts, :position, :integer
  end
end
