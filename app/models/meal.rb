class Meal < ActiveRecord::Base
  has_many :daily_meal_meals
  has_many :daily_meals, through: :daily_meal_meals

  accepts_nested_attributes_for :daily_meals
end
