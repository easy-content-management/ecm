# This migration comes from ecm_files (originally 20180301094240)
class CreateEcmFilesFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :ecm_files_folders do |t|
      t.string :name
      t.timestamp :published_at
      t.text :description

      t.timestamps
    end
  end
end
