class FixInOutBoundIdName < ActiveRecord::Migration
  def change
    rename_column :inbound_infos, :inbound_id, :inbound_share_id
    rename_column :outbound_infos, :outbound_id, :outbound_share_id
  end
end
