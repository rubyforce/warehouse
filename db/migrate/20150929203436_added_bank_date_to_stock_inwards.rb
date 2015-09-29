class AddedBankDateToStockInwards < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :bank_date, :date
  end
end
