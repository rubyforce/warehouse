class Changecolumnfrompaymentvouchertable < ActiveRecord::Migration
  def change
    rename_column :payment_vouchers, :vehicle_company_id, :expense_id
  end
end
