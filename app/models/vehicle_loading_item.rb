class VehicleLoadingItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :vehicle
end
