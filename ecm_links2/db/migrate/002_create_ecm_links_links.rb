class CreateEcmLinksLinks < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_links_links do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :markup_language

      # associations
      t.references :ecm_links_category

      # acts as list
      t.integer :position

      t.timestamps
    end
    add_index :ecm_links_links, :ecm_links_category_id
  end
end
