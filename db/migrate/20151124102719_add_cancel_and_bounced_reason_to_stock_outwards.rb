class AddCancelAndBouncedReasonToStockOutwards < ActiveRecord::Migration
  def change
    add_column :stock_outwards, :cancel_transaction, :string
    add_column :stock_outwards, :cheque_bounce, :string
    add_column :stock_outwards, :reason, :text
  end
end
