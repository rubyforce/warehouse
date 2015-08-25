class Item < ActiveRecord::Base
  belongs_to :package_type
  belongs_to :container
  belongs_to :company, class_name: "Company", foreign_key: "company_id"

  has_many :grievance
end
