class RateMaster < ActiveRecord::Base
  belongs_to :company, class_name: "Company", foreign_key: "company_id"
  belongs_to :item

  has_many :item_rate_masters

  accepts_nested_attributes_for :item_rate_masters
end
