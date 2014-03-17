class CreateSigmamu < ActiveRecord::Migration
  def change
    create_table :sigmamus do |t|
      t.integer :topip_id
      t.float :sigma
      t.float :mu

      t.timestamps
    end
  end
end
