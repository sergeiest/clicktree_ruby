class CreateDailyrequests < ActiveRecord::Migration
  def change
    create_table :dailyrequests do |t|
      t.integer :company_id
      t.string :name
      t.float :value
      t.integer :type_id
      t.datetime :rdate

      t.timestamps
    end
  end
end
