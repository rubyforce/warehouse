class CreateVehicleLoadingItems < ActiveRecord::Migration
  def change
    create_table :vehicle_loading_items do |t|
      t.integer :vehicle_id
      t.integer :warehouse_id
      t.integer :device_id
      t.integer :item_id
      t.string :qty
      t.string :s_qty
      t.decimal :rate
      t.decimal :amount


      t.timestamps null: false
    end
  end
end
