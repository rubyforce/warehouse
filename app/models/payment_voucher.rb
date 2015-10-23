class PaymentVoucher < ActiveRecord::Base
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id"
  belongs_to :employee, class_name: "Employee", foreign_key: "employee_id"
  belongs_to :expense, class_name: "Expense", foreign_key: "expense_id"
end
