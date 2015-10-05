class AnotherOneColumnToThe < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :amount, :decimal
  end
end
