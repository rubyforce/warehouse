class EmployeeSalaryReceipt < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_receipt
end
