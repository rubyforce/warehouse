class AddVehicleLoadingIdFieldToVehicleLoadingItems < ActiveRecord::Migration
  def change
    add_column :vehicle_loading_items, :vehicle_loading_id, :integer
  end
end
