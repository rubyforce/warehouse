class AddAnotherOneColumntWithDateJustOnlyToPaymentVouchers < ActiveRecord::Migration
  def change
    add_column :payment_vouchers, :bank_date, :date
  end
end
