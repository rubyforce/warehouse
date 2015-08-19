class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string  :name
      t.string  :reg_no
      t.integer :vehicle_company_id
      t.date    :date_of_purchase
      t.date    :insurance_renewal

      t.timestamps null: false
    end
  end
end
