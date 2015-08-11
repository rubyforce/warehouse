class ExpenseReceipt < ActiveRecord::Base
  belongs_to :nature
  belongs_to :employee
  belongs_to :expense_by, class_name: "Employee", foreign_key: "expense_by_id"
  belongs_to :authorized_by, class_name: "Employee", foreign_key: "authorized_by_id"
end
