class CreateVehicleUnloadingItems < ActiveRecord::Migration
  def change
    create_table :vehicle_unloading_items do |t|
      t.integer  :item_id
      t.string   :qty
      t.string   :s_qty
      t.string   :return
      t.string   :breakage
      t.string   :faulty
      t.string   :item_name
      t.integer  :vehicle_unloading_id

      t.timestamps null: false
    end
  end
end
