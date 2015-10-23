class DataToStockOutwardsTable < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :amout, :decimal
  end
end
