class Admin::SalariesController < ApplicationController
  respond_to :json

  def index
    @salaries = Salary.all
    render :json => @salaries.as_json(:include => :employee_salaries)
  end

  def show
    @salary = Salary.find(params[:id])
    render :json => @salary.as_json(:include => :employee_salaries)
  end

  def print
    @salary = Salary.find(params[:id])
    render :layout => 'print'
  end

  def new
    @salary = Salary.new
  end

  def create
    @salary = Salary.new(params[:salary])
    @salary.save
    render :json => @salary.as_json(:include => :employee_salaries)
  end

  def edit
    @salary = Salary.find(params[:id])
    render :json => @salary.as_json(:include => :employee_salaries)
  end

  def update
    @salary = Salary.find(params[:id])
    @salary.update_attributes(params[:salary])
    render :json => @salary.as_json(:include => :employee_salaries)
  end

  def destroy
    @salary = Salary.find(params[:id])
    @salary.destroy
    render :json => @salary.as_json(:include => :employee_salaries)
  end

  def paid_salary
    date = Date.parse(params[:date])

    collection = Salary
    .where('month = ?', date.month.to_s)
    .where('year = ?', date.year.to_s)
    .includes(:employee_salaries)
    .map(&:employee_salaries)
    .flatten
    render :json => collection
  end
end
