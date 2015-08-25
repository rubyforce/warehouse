class PaymentVoucher < ActiveRecord::Base
  belongs_to :ledger, class_name: "Ledger", foreign_key: "ledger_id"
  belongs_to :employee, class_name: "Employee", foreign_key: "employee_id"
  belongs_to :vehicle_company, class_name: "VehicleCompany", foreign_key: "vehicle_company_id" 
end
