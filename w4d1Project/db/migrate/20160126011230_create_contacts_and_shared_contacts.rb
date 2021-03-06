class CreateContactsAndSharedContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :contacts, [:user_id, :email], unique: true
    add_index :contacts, :user_id

    create_table :shared_contacts do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :shared_contacts, [:user_id, :contact_id], unique: true
    add_index :shared_contacts, :contact_id
    add_index :shared_contacts, :user_id
  end
end
