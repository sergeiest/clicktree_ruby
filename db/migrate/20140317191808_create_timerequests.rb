class CreateTimerequests < ActiveRecord::Migration
  def change
    create_table :timerequests do |t|
      t.integer :topip_id
      t.datetime :request_time

      t.timestamps
    end
  end
end
