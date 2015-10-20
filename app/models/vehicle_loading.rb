class VehicleLoading < ActiveRecord::Base
  has_many :vehicle_loading_items
  belongs_to :warehouse
  belongs_to :vehicle
  belongs_to :device

  has_many :items, :through => :vehicle_loading_items
  accepts_nested_attributes_for :vehicle_loading_items
end
