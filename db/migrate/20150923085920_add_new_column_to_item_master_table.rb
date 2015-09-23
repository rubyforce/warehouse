class AddNewColumnToItemMasterTable < ActiveRecord::Migration
  def change
    add_column :items, :tax, :decimal
  end
end
