class AddLastOneFieldToStockIn < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :final_total, :decimal
  end
end
