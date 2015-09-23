class NewFieldForStockInwardItemsTable < ActiveRecord::Migration
  def change
    add_column :stock_inward_items, :amount, :decimal
  end
end
