class CreateApi < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :name
      t.string :maindiv
      t.string :url
    end
  end
end
