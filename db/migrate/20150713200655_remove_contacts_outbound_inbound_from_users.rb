class RemoveContactsOutboundInboundFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :inbound_shares, :json
    remove_column :users, :outbound_shares, :json
    remove_column :users, :contact_list, :integer
  end
end
