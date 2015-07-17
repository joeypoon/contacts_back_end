class MoveNameAndEmailToUsers < ActiveRecord::Migration
  def change
    remove_column :contact_infos, :name, :string
    remove_column :contact_infos, :email, :string
  end
end
