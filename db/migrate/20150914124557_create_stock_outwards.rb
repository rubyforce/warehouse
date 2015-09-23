class CreateStockOutwards < ActiveRecord::Migration
  def change
    create_table :stock_outwards do |t|
      t.date    :date
      t.string  :invoice_no
      t.string  :voucher_no
      t.decimal :cash
      t.string  :cheque_no
      t.string  :bank_name

      t.timestamps null: false
    end
  end
end
