class AddVehicleNameToVehicleLoadingItems < ActiveRecord::Migration
  def change
    add_column :vehicle_loading_items, :vehicle_name, :string
  end
end
