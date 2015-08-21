class CreatePaymentVouchers < ActiveRecord::Migration
  def change
    create_table :payment_vouchers do |t|
      t.string  :voucher_no
      t.date    :date
      t.decimal :amount
      t.boolean :payment_method, default: false
      t.string  :cheque_no
      t.string  :bank_name
      t.decimal :cash


      t.timestamps null: false
    end
  end
end
