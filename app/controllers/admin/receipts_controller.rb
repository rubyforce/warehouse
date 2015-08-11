class Admin::ReceiptsController < ApplicationController
  respond_to :json

  def index
    @receipts = Receipt

    if params[:number].present?
      @receipts = @receipts.where(number: params[:number])
    elsif params[:cheque_number].present?
      @receipts = @receipts.where(cheque_number: params[:cheque_number])
    end

    if params[:cheque_number].present?
      @receipts = @receipts.where(cheque_number: params[:cheque_number])
    end

    @receipts = @receipts.all
    render :json => @receipts.as_json(
      :include => [
        :receipts_fees_heads,
        :fees_heads,
        :student => {
          :only => [ :id, :first_name, :last_name ],
          :methods => [ :full_name ],
          :include => [ :standard, :division ]
        }
      ]
    )
  end

  def show
    @receipt = Receipt.find(params[:id])
    render :json => @receipt.as_json(
     :include => [
        :receipts_fees_heads
      ]
    )
  end

  def print
    @receipt = Receipt.find(params[:id])
    render :layout => 'print'
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(params[:receipt])
    # @receipt.student.fees_heads << @receipt.fees_heads
    @receipt.save
    render :json => @receipt.as_json(:include => :receipts_fees_heads)
  end

  def edit
    @receipt = Receipt.find(params[:id])
    render :json => @receipt.as_json(:include => :receipts_fees_heads)
  end

  def update
    @receipt = Receipt.find(params[:id])
    @receipt.update_attributes(params[:receipt])
    render :json => @receipt.as_json(:include => :receipts_fees_heads)
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    render :json => @receipt.as_json(:include => :receipts_fees_heads)
  end

  def check
    @student = Receipt.find(params[:student])
  end

  def receipt_id
    @receipt = Receipt.order('id asc').last
    render :json => @receipt
  end

  def paid_fees
    date = Date.parse(params[:date])

    @receipts = Receipt
        .where('date BETWEEN ? AND ?', date.beginning_of_month, date.end_of_month)
        .where(student_id: params[:student_id])
        .where(status: nil)
        .where(cheque_status: nil)
        .includes(:fees_heads)
        .map(&:fees_heads)
        .flatten
    render :json => @receipts
  end
end
