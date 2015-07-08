class AddUserIdToCurrentPosition < ActiveRecord::Migration
  def change
    add_column :current_positions, :user_id, :integer
  end
end
