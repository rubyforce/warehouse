class MiddayManagement < ActiveRecord::Base
  belongs_to :meal
  belongs_to :daily_meal
end
