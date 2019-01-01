class CreateUserContactCallHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_contact_call_histories do |t|

      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :user_id, null: false
      t.integer :user_contact_id, null: false

      t.jsonb  :other_details, default: []
      t.string :created_by, null: false, default: 'system@truecaller.com'
      t.string :updated_by, null: false, default: 'system@truecaller.com'
      t.boolean :is_active, default: true

      t.timestamp :deleted_at
      t.timestamps

      t.index :created_at
      t.index :is_active

    end
    add_foreign_key :user_contact_call_histories, :users, column: :user_id
    add_foreign_key :user_contact_call_histories, :user_contacts, column: :user_contact_id
  end
end
