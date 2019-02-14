# This migration comes from ecm_cms (originally 7)
class CreateEcmCmsContentBoxes < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_cms_content_boxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
