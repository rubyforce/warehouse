class VehicleUnloading < ActiveRecord::Base
  has_many :vehicle_unloading_items
  belongs_to :warehouse
  belongs_to :vehicle
  belongs_to :device

  has_many :items, :through => :vehicle_unloading_items
  accepts_nested_attributes_for :vehicle_unloading_items
end
