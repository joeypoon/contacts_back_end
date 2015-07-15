class RemoveContactInfoTable < ActiveRecord::Migration
  def change
    drop_table :contact_infos
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :company, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
    add_column :users, :site, :string
  end
end
