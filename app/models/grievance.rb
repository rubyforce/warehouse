class Grievance < ActiveRecord::Base
  belongs_to :reason

  accepts_nested_attributes_for :reason
end
