class ChangeColumnNameToApiid < ActiveRecord::Migration
  def change
  	rename_column :blockedips, :apiip, :apiid
  end
end
