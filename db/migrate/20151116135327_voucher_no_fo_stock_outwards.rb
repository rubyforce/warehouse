class VoucherNoFoStockOutwards < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :receipt_no, :string
  end
end
