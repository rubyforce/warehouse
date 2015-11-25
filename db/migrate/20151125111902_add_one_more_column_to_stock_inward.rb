class AddOneMoreColumnToStockInward < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :payment_method, :string
  end
end
