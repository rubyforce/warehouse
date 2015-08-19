class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_id
      t.string  :other_info
      t.integer :vehicle_id

      t.timestamps null: false
    end
  end
end
