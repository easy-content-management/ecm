# This migration comes from ecm_links (originally 20170605034337)
class RemoveCounterCachesFromEcmLinksCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :ecm_links_categories, :ecm_links_links_count
  end
end
