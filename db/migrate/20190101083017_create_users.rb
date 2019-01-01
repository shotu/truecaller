class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.string :created_by, null: false, default: 'system@truecaller.com'
      t.string :updated_by, null: false, default: 'system@truecaller.com'
      t.string :status
      t.boolean :is_active, default: true
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
