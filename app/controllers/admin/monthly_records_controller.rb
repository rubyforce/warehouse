class Admin::MonthlyRecordsController < ApplicationController
  respond_to :json

  def index
    @monthly_records = MonthlyRecord.all
    respond_with @monthly_records
  end

  def show
    @monthly_record = MonthlyRecord.find(params[:id])

    render :json => @monthly_record
  end

  def new
    @monthly_record = MonthlyRecord.new
  end

  def create
    @monthly_record = MonthlyRecord.find_or_initialize_by(month: params[:monthly_record][:month], year: Date.today.year)
    @monthly_record.assign_attributes(params[:monthly_record])
    @monthly_record.save!

    render :json => @monthly_record
  end

  def edit
    @monthly_record = MonthlyRecord.find(params[:id])
    render :json => @monthly_record
  end

  def update
    @monthly_record = MonthlyRecord.find(params[:id])
    @monthly_record.update_attributes(params[:monthly_record])
    render :json => @monthly_record
  end

  def month
    daily_meals = DailyMeal
    .where("EXTRACT(year FROM daily_meals.date) = EXTRACT(year FROM NOW()) AND EXTRACT(month FROM daily_meals.date) = ?", params[:month].to_i)
    .includes(:daily_meal_meals)
    .all

    lol = params[:month].to_i - 1

    if lol == 0
      previous_month = DateTime.parse("#{DateTime.now.year - 1}-12-01").to_date
    else 
      previous_month = DateTime.parse("#{DateTime.now.year}-#{lol}-01").to_date
    end

    monthly_record = MonthlyRecord
    .where("EXTRACT(month FROM to_date(?, 'YYYY-MM-DD')) = cast(monthly_records.month as integer) AND EXTRACT(year FROM to_date(?, 'YYYY-MM-DD')) = cast(year as integer)", previous_month , previous_month)
    .includes(:monthly_meal_meals)
    .first

    monthly_record_month = MonthlyRecord
    .where("CAST(monthly_records.year as integer) = EXTRACT(year FROM NOW()) AND CAST(monthly_records.month AS integer) = ?", params[:month].to_i)
    .includes(:monthly_meal_meals)
    .first

    render :json => {
      daily_meals: daily_meals.as_json(include: :daily_meal_meals),
      monthly_record: monthly_record.as_json(include: :monthly_meal_meals),
      monthly_record_month: monthly_record_month.as_json(include: :monthly_meal_meals)
    }
  end
end
