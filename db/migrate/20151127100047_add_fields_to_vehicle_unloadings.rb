class AddFieldsToVehicleUnloadings < ActiveRecord::Migration
  def change
    add_column :vehicle_unloadings, :date, :date
    add_column :vehicle_unloadings, :voucher_no, :string
    add_column :vehicle_unloadings, :note, :text
    add_column :vehicle_unloadings, :amount, :decimal
    add_column :vehicle_unloadings, :rate, :decimal
    add_column :vehicle_unloadings, :vehicle_id, :integer
    add_column :vehicle_unloadings, :warehouse_id, :integer
    add_column :vehicle_unloadings, :device_id, :integer
  end
end
