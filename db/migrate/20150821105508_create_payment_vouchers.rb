class CreatePaymentVouchers < ActiveRecord::Migration
  def change
    create_table :payment_vouchers do |t|
      t.string  :voucher_no
      t.date    :date
      t.decimal :amount


      t.timestamps null: false
    end
  end
end
