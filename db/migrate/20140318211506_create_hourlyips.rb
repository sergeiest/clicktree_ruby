class CreateHourlyips < ActiveRecord::Migration
  def change
    create_table :hourlyips do |t|
      t.integer :topip_id
      t.integer :hour
      t.integer :count

      t.timestamps
    end
  end
end
