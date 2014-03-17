class AddTypeIdToPages < ActiveRecord::Migration
  def change 
  	add_column :pages, :type_id, :integer
  end
end
