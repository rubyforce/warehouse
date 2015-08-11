class Employee < ActiveRecord::Base
  belongs_to :cash_management
	belongs_to :paid_type
	belongs_to :section
	belongs_to :pay_band

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
