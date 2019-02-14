# This migration comes from ecm_galleries (originally 20180302082402)
class CreateEcmGalleriesPictureDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :ecm_galleries_picture_details do |t|
      t.integer :picture_gallery_id
      t.integer :asset_id
      t.string :title
      t.text :description
      t.integer :position
      t.timestamp :published_at

      t.timestamps
    end
  end
end
