class VehicleCompany < ActiveRecord::Base
  has_many :vehicles, dependent: :destroy
end
