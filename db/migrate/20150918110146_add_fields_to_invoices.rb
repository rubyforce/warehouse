class AddFieldsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :date, :date
    add_column :invoices, :reason, :string
  end
end
