class AddNewFieldToOutstanding < ActiveRecord::Migration
  def change
    add_column :outstanding_payments, :amount, :decimal
  end
end
