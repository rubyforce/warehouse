class Requisition < ActiveRecord::Base
  has_many :requisition_items
  has_many :items, through: :requisition_items
  has_many :warehouses, through: :requisition_items
  has_many :companies, through: :requisition_items

  accepts_nested_attributes_for :requisition_items
end
