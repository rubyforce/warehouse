class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_company
  has_many :devices, dependent: :destroy
end
