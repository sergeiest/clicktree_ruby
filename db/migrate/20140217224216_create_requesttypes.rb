class CreateRequesttypes < ActiveRecord::Migration
  def change
    create_table :requesttypes do |t|
      t.integer :company_id
      t.string :name
      t.float :value
      t.integer :type_id

      t.timestamps
    end
  end
end
