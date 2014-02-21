class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :company
      t.integer :authentication_id

      t.timestamps
    end
  end
end
