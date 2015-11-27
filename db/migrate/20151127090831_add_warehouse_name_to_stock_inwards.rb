class AddWarehouseNameToStockInwards < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :warehouse_name, :string
  end
end
