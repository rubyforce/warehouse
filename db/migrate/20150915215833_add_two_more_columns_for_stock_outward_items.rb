class AddTwoMoreColumnsForStockOutwardItems < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :device_id, :integer
  end
end
