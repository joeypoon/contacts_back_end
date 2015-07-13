class RemoveInboundOutbound < ActiveRecord::Migration
  def change
    drop_table :outbound_infos
    drop_table :inbound_infos
    drop_table :inbound_shares
    drop_table :outbound_shares
  end
end
