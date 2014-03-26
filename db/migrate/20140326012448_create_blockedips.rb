class CreateBlockedips < ActiveRecord::Migration
  def change
    create_table :blockedips do |t|
      t.string :ip
      t.integer :lastid

      t.timestamps
    end
  end
end
