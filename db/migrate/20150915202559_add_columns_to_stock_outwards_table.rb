class AddColumnsToStockOutwardsTable < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :credit, :string
    add_column :stock_outwards, :discount, :string
  end
end
