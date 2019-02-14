# This migration comes from ecm_sliders_engine (originally 1)
class CreateEcmSlidersSliders < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_sliders_sliders do |t|
      t.string :locale
      t.string :name
      t.text :description
      t.boolean :auto_start
      t.decimal :interval, :precision => 8, :scale => 2

      # friendly id
      t.string :slug

      # associations
      t.integer :ecm_sliders_items_count, :default => 0, :null => false

      t.timestamps
    end
  end
end
