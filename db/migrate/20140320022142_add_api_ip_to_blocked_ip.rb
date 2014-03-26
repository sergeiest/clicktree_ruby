class AddApiIpToBlockedIp < ActiveRecord::Migration
  def change
  	add_column :blockedips, :apiip, :integer
  end
end
