class Admin::CashManagementsController < ApplicationController
  respond_to :json

  def index
    @cash_managements = CashManagement.all
    respond_with @cash_managements
  end

  def show
    @cash_management = CashManagement.find(params[:id])

    render :json => @cash_management
  end

  def new
    @cash_management = CashManagement.new
  end

  def create
    @cash_management = CashManagement.new(params[:cash_management])
    @cash_management.save

    render :json => @cash_management
  end

  def edit
    @cash_management = CashManagement.find(params[:id])
    render :json => @cash_management
  end

  def update
    @cash_management = CashManagement.find(params[:id])
    @cash_management.update_attributes(params[:cash_management])
    render :json => @cash_management
  end

  def destroy
    @cash_management = CashManagement.find(params[:id])
    @cash_management.destroy
    render :json => @cash_management
  end

  def cash_paid
    @cash_paid = ExpenseReceipt.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).sum(:amount)
    render :json => { value: @cash_paid }
  end
end
