class EmployeeSalary < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary
end
