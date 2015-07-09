class AddOutInBoundToUsers < ActiveRecord::Migration
  def change
    add_column :users, :inbound_shares, :integer, array: true, default: []
    add_column :users, :outbound_shares, :integer, array: true, default: []
  end
end
