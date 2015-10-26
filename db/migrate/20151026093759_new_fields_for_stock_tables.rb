class NewFieldsForStockTables < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :total, :decimal
    add_column :stock_outwards, :final_total, :decimal
    add_column :stock_inwards, :final_total, :decimal
  end
end
