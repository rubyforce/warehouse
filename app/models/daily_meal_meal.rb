class DailyMealMeal < ActiveRecord::Base
  belongs_to :meal
  belongs_to :daily_meal_meal
end
