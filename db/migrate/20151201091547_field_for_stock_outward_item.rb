class FieldForStockOutwardItem < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :sub_amount, :decimal
  end
end
