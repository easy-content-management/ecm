# This migration comes from ecm_rbac (originally 20160301103240)
class CreateEcmRbacRolePermissions < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_rbac_role_permissions do |t|
      t.integer :role_id, index: true
      t.integer :permission_id, index: true

      t.timestamps null: false
    end
  end
end
