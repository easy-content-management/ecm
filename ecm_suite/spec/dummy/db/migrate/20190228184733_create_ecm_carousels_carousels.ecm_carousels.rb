# This migration comes from ecm_carousels (originally 1)
class CreateEcmCarouselsCarousels < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_carousels_carousels do |t|
      t.string :locale      
      t.string :identifier
      t.string :variant_options

      t.timestamps
    end
  end
end
