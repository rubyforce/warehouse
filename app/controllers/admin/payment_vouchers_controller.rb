class Admin::PaymentVouchersController < ApplicationController
  respond_to :json

  def index
    @payment_vouchers = PaymentVoucher.all
    render :json => @payment_vouchers
  end

  def show
    @payment_voucher = PaymentVoucher.find(params[:id])
    render :json => @payment_voucher
  end

  def print
    @payment_voucher = PaymentVoucher.find(params[:id])
    render :layout => 'print'
  end

  def new
    @payment_voucher = PaymentVoucher.new
  end

  def create
    @payment_voucher = PaymentVoucher.new(params[:payment_voucher])
    # @receipt.student.fees_heads << @receipt.fees_heads
    @payment_voucher.save
    render :json => @payment_voucher
  end

  def edit
    @payment_voucher = PaymentVoucher.find(params[:id])
    render :json => @payment_voucher
  end

  def update
    @payment_voucher = PaymentVoucher.find(params[:id])
    @payment_voucher.update_attributes(params[:payment_voucher])
    render :json => @payment_voucher
  end

  def destroy
    @payment_voucher = PaymentVoucher.find(params[:id])
    @payment_voucher.destroy
    render :json => @payment_voucher
  end


  def payment_id
    @payment_voucher = PaymentVoucher.order('id asc').last
    render :json => @payment_voucher
  end
end
