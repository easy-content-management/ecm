class AddColorToEcmTagsTags < ActiveRecord::Migration[4.2]
  def change
    add_column :ecm_tags_tags, :color, :string
  end
end
