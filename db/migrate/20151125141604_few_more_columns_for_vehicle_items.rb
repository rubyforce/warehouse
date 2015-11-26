class FewMoreColumnsForVehicleItems < ActiveRecord::Migration
  def change
    add_column :vehicle_loading_items, :warehouse_id, :integer
    add_column :vehicle_loading_items, :warehouse_name, :string
    add_column :vehicle_loading_items, :device_id, :integer
    add_column :vehicle_loading_items, :device_name, :string
  end
end
