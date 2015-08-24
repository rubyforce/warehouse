class Employee < ActiveRecord::Base
  belongs_to :paid_type

  has_many :payment_vouchers, :dependent => :destroy

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
