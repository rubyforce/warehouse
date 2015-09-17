class CreateStockInwards < ActiveRecord::Migration
  def change
    create_table :stock_inwards do |t|
      t.date    :date
      t.string  :requisition_ref
      t.string  :voucher_no
      t.text    :note
      t.string  :invoice_no
      t.decimal :amount
      t.string  :cheque_no

      t.timestamps null: false
    end
  end
end
