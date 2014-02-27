class CreateTopips < ActiveRecord::Migration
  def change
    create_table :topips do |t|
      t.integer :company_id
      t.string :title
      t.string :ipaddress
      t.integer :request
      t.integer :type_id

      t.timestamps
    end
  end
end
