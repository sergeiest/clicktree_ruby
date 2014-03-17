class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :topip_id
      t.string :url
      t.integer :freq

      t.timestamps
    end
  end
end
