class CreateItemRateMasters < ActiveRecord::Migration
  def change
    create_table :item_rate_masters do |t|
      t.decimal :rate
      t.string  :companies
      t.integer :item_id
      t.integer :item_rate_master_id

      t.timestamps null: false
    end
  end
end
