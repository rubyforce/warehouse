class Admin::OutstandingPaymentsController < ApplicationController
  respond_to :json

  def index
    @outstanding_payments = OutstandingPayment.all

    render :json => @outstanding_payments
  end

  def show
    @outstanding_payment = OutstandingPayment.find(params[:id])

    render :json => @outstanding_payment
  end

  def new
    @outstanding_payment = OutstandingPayment.new
  end

  def create
    @outstanding_payment = OutstandingPayment.new(params[:outstanding_payment])
    @outstanding_payment.save

    render :json => @outstanding_payment
  end

  def edit
    @outstanding_payment = OutstandingPayment.find(params[:id])

    render :json => @outstanding_payment
  end

  def update
    @outstanding_payment = OutstandingPayment.find(params[:id])
    @outstanding_payment.update_attributes(params[:outstanding_payment])

    render :json => @outstanding_payment
  end

  def destroy
    @outstanding_payment = OutstandingPayment.find(params[:id])
    @outstanding_payment.destroy

    render :json => @outstanding_payment
  end

  def print
    @outstanding_payment = OutstandingPayment.find(params[:id])

    render :layout => "print"
  end
end
