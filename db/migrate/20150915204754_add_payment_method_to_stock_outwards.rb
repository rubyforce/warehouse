class AddPaymentMethodToStockOutwards < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :payment_method, :string
  end
end
