# This migration comes from ecm_cms (originally 2)
class CreateEcmCmsPages < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_cms_pages do |t|
      t.string :basename
      t.string :pathname
      t.string :title
      t.text :meta_description
      t.text :body
      t.string :layout
      t.string :locale
      t.string :format
      t.string :handler
      t.references :ecm_cms_folder

      t.timestamps
    end
    add_index :ecm_cms_pages, :ecm_cms_folder_id
  end
end
