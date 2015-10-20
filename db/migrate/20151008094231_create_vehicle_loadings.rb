class CreateVehicleLoadings < ActiveRecord::Migration
  def change
    create_table :vehicle_loadings do |t|
      t.date :date
      t.string :voucher_no
      t.text :note
      t.decimal :amount
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
