class AddSharedToShares < ActiveRecord::Migration
  def change
    add_column :shares, :shared, :boolean, default: false
  end
end
