class RenameEcmLinksCategoryIdOnEcmLinksLinks < ActiveRecord::Migration[5.1]
  def change
    rename_column :ecm_links_links, :ecm_links_category_id, :category_id
  end
end
