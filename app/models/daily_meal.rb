class DailyMeal < ActiveRecord::Base
  has_many :daily_meal_meals
  has_many :meals, through: :daily_meal_meals

  accepts_nested_attributes_for :daily_meal_meals
end
