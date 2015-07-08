class CreateCurrentPositions < ActiveRecord::Migration
  def change
    create_table :current_positions do |t|
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
