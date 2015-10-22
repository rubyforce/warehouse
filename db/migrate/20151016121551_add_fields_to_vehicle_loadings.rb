class AddFieldsToVehicleLoadings < ActiveRecord::Migration
  def change
    add_column :vehicle_loadings, :vehicle_id, :integer
    add_column :vehicle_loadings, :warehouse_id, :integer
    add_column :vehicle_loadings, :device_id, :integer
  end
end
