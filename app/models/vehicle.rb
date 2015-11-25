class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_company
  has_many :devices, dependent: :destroy
  has_many :vehicle_loading_items
end
