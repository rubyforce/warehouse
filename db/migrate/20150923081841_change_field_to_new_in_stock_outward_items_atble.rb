class ChangeFieldToNewInStockOutwardItemsAtble < ActiveRecord::Migration
  def change
    rename_column :stock_outward_items, :company_id, :ledger_id
  end
end
