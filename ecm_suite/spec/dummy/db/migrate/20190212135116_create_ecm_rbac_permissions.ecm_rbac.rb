# This migration comes from ecm_rbac (originally 20160301103219)
class CreateEcmRbacPermissions < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_rbac_permissions do |t|
      t.string :identifier
      t.timestamp :enabled_from
      t.timestamp :enabled_to

      t.timestamps null: false
    end
  end
end
