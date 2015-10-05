class ColumnForStockOutwardItems < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :rate, :decimal
  end
end
