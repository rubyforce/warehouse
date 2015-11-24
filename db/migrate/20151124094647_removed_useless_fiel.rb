class RemovedUselessFiel < ActiveRecord::Migration
  def change
    remove_column :stock_outwards, :cancel_transaction, :string
    remove_column :stock_outwards, :cheque_bounce, :string
  end
end
