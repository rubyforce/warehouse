class OutstandingPayment < ActiveRecord::Base
  has_many :stock_outwards

  accepts_nested_attributes_for :stock_outwards
end
