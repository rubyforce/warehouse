class FewMoreColumnsForStockInwardItemsTable < ActiveRecord::Migration
  def change
    add_column :stock_inward_items, :item_name, :string
    add_column :stock_inward_items, :company_name, :string
    add_column :stock_inward_items, :warehouse_name, :string
  end
end
