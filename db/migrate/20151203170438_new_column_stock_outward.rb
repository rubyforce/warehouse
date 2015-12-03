class NewColumnStockOutward < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :final_summary, :decimal
  end
end
