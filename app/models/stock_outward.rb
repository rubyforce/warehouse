class StockOutward < ActiveRecord::Base
  has_many :stock_outward_items

  has_many :items, :through => :stock_outward_items
  has_many :warehouses, :through => :stock_outward_items
  has_many :companies, :through => :stock_outward_items
  has_many :devices, :through => :stock_outward_items

  accepts_nested_attributes_for :stock_outward_items
end
