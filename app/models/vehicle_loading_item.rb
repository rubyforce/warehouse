class VehicleLoadingItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :warehouse
  belongs_to :device
  belongs_to :vehicle
end
