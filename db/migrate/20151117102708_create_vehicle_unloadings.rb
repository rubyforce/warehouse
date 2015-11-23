class CreateVehicleUnloadings < ActiveRecord::Migration
  def change
    create_table :vehicle_unloadings do |t|

      t.timestamps null: false
    end
  end
end
