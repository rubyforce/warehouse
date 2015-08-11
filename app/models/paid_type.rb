class PaidType < ActiveRecord::Base
  has_many :empolyees, dependent: :destroy
end
