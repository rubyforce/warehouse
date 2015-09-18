class Admin::InvoicesController < ApplicationController
  respond_to :json

  def index
    @invoices = Invoice.all

    render :json => @invoices
  end

  def show
    @invoice = Invoice.find(params[:id])

    render :json => @invoice
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.save

    render :json => @invoice
  end

  def edit
    @invoice = Invoice.find(params[:id])

    render :json => @invoice
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params[:invoice])

    render :json => @invoice
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    render :json => @invoice
  end
end
