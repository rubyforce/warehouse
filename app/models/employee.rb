class Employee < ActiveRecord::Base
  belongs_to :paid_type

  has_many :payment_vouchers, :dependent => :destroy
end
