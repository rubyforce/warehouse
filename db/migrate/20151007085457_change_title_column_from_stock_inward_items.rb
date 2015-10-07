class ChangeTitleColumnFromStockInwardItems < ActiveRecord::Migration
  def change
    rename_column :stock_inward_items, :sum_taxes, :tax
  end
end
