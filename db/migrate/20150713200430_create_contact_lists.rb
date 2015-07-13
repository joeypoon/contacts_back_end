class CreateContactLists < ActiveRecord::Migration
  def change
    create_table :contact_lists do |t|
      t.integer :user_id
      t.integer :list, array: true, default: []

      t.timestamps null: false
    end

    add_index :contact_lists, :user_id
  end
end
