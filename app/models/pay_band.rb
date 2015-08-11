class PayBand < ActiveRecord::Base
  has_many :employees, dependent: :destroy
end
