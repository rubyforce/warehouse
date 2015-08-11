class Admin::ExpenseReceiptsController < ApplicationController
  respond_to :json

  def index
    @expense_receipts = ExpenseReceipt.all
    render :json => @expense_receipts
  end

  def show
    @expense_receipt = ExpenseReceipt.find(params[:id])
    render :json => @expense_receipt
  end

  def print
    @expense_receipt = ExpenseReceipt.find(params[:id])
    render :layout => 'print'
  end

  def new
    @expense_receipt = ExpenseReceipt.new
  end

  def create
    @expense_receipt = ExpenseReceipt.new(params[:expense_receipt])
    @expense_receipt.save
    render :json => @expense_receipt
  end

  def edit
    @expense_receipt = ExpenseReceipt.find(params[:id])
    render :json => @expense_receipt
  end

  def update
    @expense_receipt = ExpenseReceipt.find(params[:id])
    @expense_receipt.update_attributes(params[:expense_receipt])
    render :json => @expense_receipt
  end

  def destroy
    @expense_receipt = ExpenseReceipt.find(params[:id])
    @expense_receipt.destroy
    render :json => @expense_receipt
  end
end
