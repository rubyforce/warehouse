class Caste < ActiveRecord::Base
  has_many :students, dependent: :destroy
end
