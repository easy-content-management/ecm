# This migration comes from ecm_cms (originally 3)
class CreateEcmCmsTemplates < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_cms_templates do |t|
      t.string :basename
      t.string :pathname
      t.text :body
      t.string :locale
      t.string :format
      t.string :handler

      # associations
      t.references :ecm_cms_folder

      t.timestamps
    end
    add_index :ecm_cms_templates, :ecm_cms_folder_id
  end
end
