class Admin::ExpensesController < ApplicationController
  respond_to :json

  def index
    @expenses = Expense.all
    render :json => @expenses
  end

  def show
    @expense = Expense.find(params[:id])

    render :json => @expense
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params[:expense])
    @expense.save

    render :json => @expense
  end

  def edit
    @expense = Expense.find(params[:id])
    render :json => @expense
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update_attributes(params[:expense])
    render :json => @expense
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    render :json => @expense
  end
end
