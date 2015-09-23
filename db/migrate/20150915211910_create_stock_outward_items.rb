class CreateStockOutwardItems < ActiveRecord::Migration
  def change
    create_table :stock_outward_items do |t|
      t.integer :company_id
      t.integer :item_id
      t.integer :warehouse_id
      t.integer :stock_outward_id
      t.integer :device_id
      t.decimal :qty
      t.decimal :s_qty
      t.decimal :discount

      t.string :company_name
      t.string :item_name
      t.string :warehouse_name
      t.string :device_id

      t.timestamps null: false
    end
  end
end
