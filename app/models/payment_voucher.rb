class PaymentVoucher < ActiveRecord::Base
  belongs_to :ledger, class_name: "Ledger", foreign_key: "ledger_id"
  belongs_to :employee, class_name: "Employee", foreign_key: "employee_id"
  belongs_to :expense, class_name: "Expense", foreign_key: "expense_id"
end
