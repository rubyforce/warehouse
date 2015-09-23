class RenameOtherFieldsStockOutwardItems < ActiveRecord::Migration
  def change
    rename_column :stock_outward_items, :company_name, :ledger_name
  end
end
