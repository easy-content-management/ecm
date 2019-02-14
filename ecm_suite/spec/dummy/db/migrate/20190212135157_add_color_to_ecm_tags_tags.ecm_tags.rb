# This migration comes from ecm_tags (originally 20161101170254)
class AddColorToEcmTagsTags < ActiveRecord::Migration[4.2]
  def change
    add_column :ecm_tags_tags, :color, :string
  end
end
