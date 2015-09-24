class OutstandingPayment < ActiveRecord::Base
  has_many :stock_outwards
end
