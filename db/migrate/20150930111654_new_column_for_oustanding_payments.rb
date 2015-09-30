class NewColumnForOustandingPayments < ActiveRecord::Migration
  def change
    add_column :outstanding_payments, :stock_outward_id, :integer
  end
end
