# This migration comes from ecm_contact (originally 20170813142704)
class CreateEcmContactContactRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :ecm_contact_contact_requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :ip_address
      t.text :message
      t.boolean :accept_terms_of_service
      t.timestamp :notified_at

      t.timestamps
    end
  end
end
