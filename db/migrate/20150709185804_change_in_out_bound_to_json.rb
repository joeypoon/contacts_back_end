class ChangeInOutBoundToJson < ActiveRecord::Migration
  def change
    remove_column :users, :inbound_shares, :integer, array: true, default: []
    remove_column :users, :outbound_shares, :integer, array: true, default: []
    add_column :users, :inbound_shares, :json, array: true, default: []
    add_column :users, :outbound_shares, :json, array: true, default: []
  end
end
