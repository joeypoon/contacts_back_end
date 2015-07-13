class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :sent_to
      t.json :info

      t.timestamps null: false
    end

    add_index :shares, :user_id
  end
end
