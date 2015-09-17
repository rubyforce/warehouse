class CreateStockInwardItems < ActiveRecord::Migration
  def change
    create_table :stock_inward_items do |t|
      t.integer :company_id
      t.integer :item_id
      t.integer :warehouse_id
      t.integer :stock_inward_id
      t.integer :numeral
      t.decimal :qty
      t.decimal :s_qty
      t.decimal :purchase_rate

      t.timestamps null: false
    end
  end
end
