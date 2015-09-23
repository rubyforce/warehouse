class LastFieldsForStockInward < ActiveRecord::Migration
  def change
    add_column :stock_inward_items, :sum_taxes, :decimal
    add_column :stock_inwards, :total, :decimal
  end
end
