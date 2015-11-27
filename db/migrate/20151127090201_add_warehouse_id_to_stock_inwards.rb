class AddWarehouseIdToStockInwards < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :warehouse_id, :integer
  end
end
