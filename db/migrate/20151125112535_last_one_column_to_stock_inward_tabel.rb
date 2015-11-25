class LastOneColumnToStockInwardTabel < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :bank_date, :date
  end
end
