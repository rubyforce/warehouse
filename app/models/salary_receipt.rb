class SalaryReceipt < ActiveRecord::Base
  has_many :employee_salary_receipts

  accepts_nested_attributes_for :employee_salary_receipts
end
