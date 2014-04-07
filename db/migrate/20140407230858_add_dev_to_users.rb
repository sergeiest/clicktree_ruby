class AddDevToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apikey, :string
    add_column :users, :status, :integer
  end
end
