class StockOutward < ActiveRecord::Base
  has_many :stock_outward_items

  has_many :items, :through => :stock_outward_items
  has_many :warehouses, :through => :stock_outward_items
  has_many :ledgers, :through => :stock_outward_items

  accepts_nested_attributes_for :stock_outward_items

  def days_since_due
    return 0 if date.blank? || created_at.blank?

    days = (date - Date.today.to_date).to_i
    days < 0 ? 0 : days
  end
end


