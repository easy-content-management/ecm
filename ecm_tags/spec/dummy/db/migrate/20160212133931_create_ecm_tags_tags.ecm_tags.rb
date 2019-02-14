# This migration comes from ecm_tags (originally 20160208121254)
class CreateEcmTagsTags < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_tags_tags do |t|
      t.string  'name'
      t.integer 'taggings_count', default: 0
    end

    add_index 'ecm_tags_tags', ['name'], name: 'index_tags_on_name', unique: true
  end
end
