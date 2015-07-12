class AddIndexToContactInfo < ActiveRecord::Migration
  def change
    add_index :contact_infos, :user_id
  end
end
