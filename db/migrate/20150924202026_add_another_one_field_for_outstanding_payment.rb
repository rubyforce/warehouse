class AddAnotherOneFieldForOutstandingPayment < ActiveRecord::Migration
  def change
    add_column :outstanding_payments, :bank_date, :date
  end
end
