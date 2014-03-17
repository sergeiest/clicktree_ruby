class AddCountryToTopip < ActiveRecord::Migration
  def change
  	add_column :topips, :country, :string
  end
end
