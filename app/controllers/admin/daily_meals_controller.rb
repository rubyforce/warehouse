class Admin::DailyMealsController < ApplicationController
  respond_to :json

  def index
    @daily_meals = DailyMeal.all
    render :json => @daily_meals.as_json(:include => :daily_meal_meals)
  end

  def show
    @daily_meal = DailyMeal.find(params[:id])

    render :json => @daily_meal.as_json(:include => :daily_meal_meals)
  end

  def new
    @daily_meal = DailyMeal.new
  end

  def create
    @daily_meal = DailyMeal.new(permit_attributes)
    @daily_meal.save

    render :json => @daily_meal.as_json(:include => :daily_meal_meals)
  end

  def edit
    @daily_meal = DailyMeal.find(params[:id])
    render :json => @daily_meal.as_json(:include => :daily_meal_meals)
  end

  def update
    @daily_meal = DailyMeal.find(params[:id])
    @daily_meal.update_attributes(permit_attributes)
    render :json => @daily_meal.as_json(:include => :daily_meal_meals)
  end

  def permit_attributes
    params.require(:daily_meal).permit!
  end
end
