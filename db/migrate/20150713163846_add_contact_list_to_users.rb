class AddContactListToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contact_list, :integer, array: true, default: []
  end
end
