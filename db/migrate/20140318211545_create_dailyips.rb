class CreateDailyips < ActiveRecord::Migration
  def change
    create_table :dailyips do |t|
      t.integer :topip_id
      t.datetime :day
      t.integer :count

      t.timestamps
    end
  end
end
