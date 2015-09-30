class AddOutstandingPaymentIdToStockOutwards < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :outstanding_payment_id, :integer
  end
end
