class OneMoreFieldsForStockInwardsTable < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :discount, :decimal
  end
end
