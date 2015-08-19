class Admin::LedgersController < ApplicationController
  respond_to :json

  def index
    @ledgers = Ledger.all
    render :json => @ledgers
  end

  def show
    @ledger = Ledger.find(params[:id])

    render :json => @ledger
  end

  def new
    @ledger = Ledger.new
  end

  def create
    @ledger = Ledger.new(permitted_params)
    @ledger.save

    render :json => @ledger
  end

  def edit
    @ledger = Ledger.find(params[:id])
    render :json => @ledger
  end

  def update
    @ledger = Ledger.find(params[:id])
    @ledger.update_attributes(permitted_params)
    render :json => @ledger
  end

  def destroy
    @ledger = Ledger.find(params[:id])
    @ledger.destroy
    render :json => @ledger
  end

  def permitted_params
    params[:ledger].delete(:id)
    params[:ledger].delete(:created_at)
    params[:ledger].delete(:updated_at)
    params[:ledger]
  end
end
