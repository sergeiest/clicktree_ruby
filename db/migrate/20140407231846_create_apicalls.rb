class CreateApicalls < ActiveRecord::Migration
  def change
    create_table :apicalls do |t|
      t.integer :user_id
      t.string :website
      t.string :method
      t.string :path

      t.timestamps
    end
  end
end
