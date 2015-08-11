class Admin::SalaryReceiptsController < ApplicationController
  respond_to :json

  def index
    @salary_receipts = SalaryReceipt.all
    respond_with @salary_receipts
  end

  def show
    @salary_receipt = SalaryReceipt.find(params[:id])
    render :json => @salary_receipt
  end

  def print
    @salary_receipt = SalaryReceipt.find(params[:id])
    render :layout => 'print'
  end

  def new
    @salary_receipt = SalaryReceipt.new
  end

  def create
    @salary_receipt = SalaryReceipt.new(params[:salary_receipt])
    @salary_receipt.save
    render :json => @salary_receipt
  end

  def edit
    @salary_receipt = SalaryReceipt.find(params[:id])
    render :json => @salary_receipt
  end

  def update
    @salary_receipt = SalaryReceipt.find(params[:id])
    @salary_receipt.update_attributes(params[:salary_receipt])
    render :json => @salary_receipt
  end

  def destroy
    @salary_receipt = SalaryReceipt.find(params[:id])
    @salary_receipt.destroy
    render :json => @salary_receipt
  end
end
