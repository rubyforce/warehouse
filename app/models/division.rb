class Division < ActiveRecord::Base
  has_many :students, dependent: :destroy
end
