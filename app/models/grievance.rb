class Grievance < ActiveRecord::Base
  has_many :reasons
  has_many :items

  accepts_nested_attributes_for :reasons
end
