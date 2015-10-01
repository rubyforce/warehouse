class TwoMoreColumnsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :cancel_transaction, :string
    add_column :invoices, :cheque_bounce, :string
  end
end
