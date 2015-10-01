class AddColumnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :stock_outward_id, :integer
  end
end
