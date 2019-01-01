class CreateUserContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_contacts do |t|

      t.integer :user_id, null: false
      t.string :name
      t.string :email
      t.string :phone
      t.jsonb  :other_details, default: []

      t.string :created_by, null: false, default: 'system@truecaller.com'
      t.string :updated_by, null: false, default: 'system@truecaller.com'
      # t.string :status
      t.boolean :is_active, default: true
      t.timestamp :deleted_at
      t.timestamps

      t.index :name
      t.index :email
      t.index :phone
      t.index :is_active
    end
    add_foreign_key :user_contacts, :users, column: :user_id
  end
end
