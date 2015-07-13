class RemoveListsFromInboundOutboundShares < ActiveRecord::Migration
  def change
    remove_column :inbound_shares, :inbound, :json
    remove_column :outbound_shares, :outbound, :json

    add_column :inbound_shares, :inbound, :integer, array: true, default: []
    add_column :outbound_shares, :outbound, :integer, array: true, default: []
  end
end
