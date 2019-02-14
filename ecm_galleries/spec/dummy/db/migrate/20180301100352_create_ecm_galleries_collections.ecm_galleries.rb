# This migration comes from ecm_galleries (originally 20180301094240)
class CreateEcmGalleriesCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :ecm_galleries_collections do |t|

      t.timestamps
    end
  end
end
