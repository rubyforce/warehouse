class AddOneMoreColumnToPayment < ActiveRecord::Migration
  def change
    add_column :payment_vouchers, :numeral, :integer
  end
end
