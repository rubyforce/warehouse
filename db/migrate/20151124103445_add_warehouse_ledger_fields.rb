class AddWarehouseLedgerFields < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :ledger_name, :string
    add_column :stock_outwards, :contact_no, :string
    add_column :stock_outwards, :ledger_id, :integer
    add_column :stock_outwards, :warehouse_name, :string
    add_column :stock_outwards, :warehouse_id, :integer
  end
end
