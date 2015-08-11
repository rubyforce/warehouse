class Section < ActiveRecord::Base
  has_many :employees, dependent: :destroy
end
