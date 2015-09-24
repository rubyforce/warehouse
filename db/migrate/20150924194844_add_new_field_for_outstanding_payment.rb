class AddNewFieldForOutstandingPayment < ActiveRecord::Migration
  def change
    add_column :outstanding_payments, :payment_method, :string
  end
end
