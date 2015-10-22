class RemoveUselessDataFromStockOutwardItems < ActiveRecord::Migration
  def change
    remove_column :stock_outward_items, :device_id, :integer
    remove_column :stock_outward_items, :device_id_name, :string
  end
end
