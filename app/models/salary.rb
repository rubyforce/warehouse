class Salary < ActiveRecord::Base
  has_many :employee_salaries

  accepts_nested_attributes_for :employee_salaries
end
