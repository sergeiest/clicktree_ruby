class CreateBlockedIps < ActiveRecord::Migration
  def change
    create_table :blocked_ips do |t|
      t.string :ip
    end
  end
end
