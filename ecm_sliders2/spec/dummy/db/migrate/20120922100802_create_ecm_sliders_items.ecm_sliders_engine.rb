# This migration comes from ecm_sliders_engine (originally 2)
class CreateEcmSlidersItems < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_sliders_items do |t|
      t.text :body
      t.string :url
      t.integer :position

      # acts as markup
      t.string :markup_language

      # associations
      t.references :ecm_sliders_slider

      # paperclip
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.timestamp :image_updated_at
      t.string :image_fingerprint

      t.timestamps
    end
  end
end
