class CreateVehicleCompanies < ActiveRecord::Migration
  def change
    create_table :vehicle_companies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
