class MonthlyRecord < ActiveRecord::Base
  has_many :monthly_meal_meals
  has_many :meals, through: :monthly_meal_meals

  accepts_nested_attributes_for :monthly_meal_meals
end
