class LastOneColumnToTheSameTable < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :tax, :decimal
  end
end
