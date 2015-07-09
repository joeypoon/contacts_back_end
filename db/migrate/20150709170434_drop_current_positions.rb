class DropCurrentPositions < ActiveRecord::Migration
  def change
    drop_table :current_positions
  end
end
