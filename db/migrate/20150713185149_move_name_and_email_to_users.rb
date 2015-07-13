class MoveNameAndEmailToUsers < ActiveRecord::Migration
  def change
    remove_column :contact_infos, :name, :string
    remove_column :contact_infos, :email, :string

    add_column :users, :name, :string
    add_column :users, :email, :string
  end
end
