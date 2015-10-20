class RemoveFieldsFromVehicleLoadingItems < ActiveRecord::Migration
  def change
    remove_column :vehicle_loading_items, :vehicle_id, :integer
    remove_column :vehicle_loading_items, :warehouse_id, :integer
    remove_column :vehicle_loading_items, :device_id, :integer

    add_column :vehicle_loading_items, :numeral, :integer
  end
end
