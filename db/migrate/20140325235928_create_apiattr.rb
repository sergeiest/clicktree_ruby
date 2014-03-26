class CreateApiattr < ActiveRecord::Migration
  def change
    create_table :apiattrs do |t|
      t.integer :api_id
      t.string :attribute
    end
  end
end
