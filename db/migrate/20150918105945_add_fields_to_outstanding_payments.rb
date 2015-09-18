class AddFieldsToOutstandingPayments < ActiveRecord::Migration
  def change
    add_column :outstanding_payments, :date, :date
    add_column :outstanding_payments, :cash, :decimal
    add_column :outstanding_payments, :cheque_no, :string
    add_column :outstanding_payments, :bank_name, :string
  end
end
