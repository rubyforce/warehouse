class StockInward < ActiveRecord::Base
  has_many :stock_inward_items

  has_many :items, :through => :stock_inward_items
  has_many :warehouses, :through => :stock_inward_items
  has_many :companies, :through => :stock_inward_items

  accepts_nested_attributes_for :stock_inward_items
end
