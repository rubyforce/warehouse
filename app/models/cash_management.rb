class CashManagement < ActiveRecord::Base
  belongs_to :employee
  belongs_to :nature
end
