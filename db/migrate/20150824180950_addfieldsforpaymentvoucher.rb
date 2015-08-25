class Addfieldsforpaymentvoucher < ActiveRecord::Migration
  def change
    add_column :payment_vouchers, :status, :string
  end
end
