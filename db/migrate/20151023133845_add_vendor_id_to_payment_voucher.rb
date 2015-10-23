class AddVendorIdToPaymentVoucher < ActiveRecord::Migration
  def change
    add_column :payment_vouchers, :vendor_id, :integer
  end
end
