class VehicleLoading < ActiveRecord::Base
  has_many :vehicle_loading_items
  has_many :items, :through => :vehicle_loading_items
  has_many :warehouses, :through => :vehicle_loading_items
  has_many :vehicles, :through => :vehicle_loading_items
  has_many :devices, :through => :vehicle_loading_items

  accepts_nested_attributes_for :vehicle_loading_items
end
