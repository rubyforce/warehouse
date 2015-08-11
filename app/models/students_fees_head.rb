class StudentsFeesHead < ActiveRecord::Base
  belongs_to :student
  belongs_to :fees_head
end
