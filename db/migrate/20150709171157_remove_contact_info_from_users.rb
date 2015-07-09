class RemoveContactInfoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :email, :string
    remove_column :users, :phone, :string
    remove_column :users, :company, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :facebook, :string
    remove_column :users, :instagram, :string
    remove_column :users, :linkedin, :string
    remove_column :users, :github, :string
    remove_column :users, :twitter, :string
    remove_column :users, :site, :string
  end
end
