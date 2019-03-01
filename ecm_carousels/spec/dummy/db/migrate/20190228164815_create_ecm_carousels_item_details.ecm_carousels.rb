# This migration comes from ecm_carousels (originally 2)
class CreateEcmCarouselsItemDetails < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_carousels_item_details do |t|
      t.references :carousel, foreign_key: false
      t.references :asset, foreign_key: false
      t.string :url
      t.text :body
      t.string :markup_language
      t.integer :position

      t.timestamps
    end
  end
end
