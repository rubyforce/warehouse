class CreateRequisitionItems < ActiveRecord::Migration
  def change
    create_table :requisition_items do |t|
      t.decimal :qty
      t.integer :numeral
      t.integer :item_id
      t.integer :warehouse_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
