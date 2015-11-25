class AddVehicleIdToVehicleLoadingItems < ActiveRecord::Migration
  def change
    add_column :vehicle_loading_items, :vehicle_id, :integer
  end
end
