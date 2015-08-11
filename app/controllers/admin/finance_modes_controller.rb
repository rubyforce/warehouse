class Admin::FinanceModesController < ApplicationController
  respond_to :json

  def index
    @finance_modes = FinanceMode.all
    respond_with @finance_modes
  end

  def show
    @finance_mode = FinanceMode.find(params[:id])

    render :json => @finance_mode
  end

  def new
    @finance_mode = FinanceMode.new
  end

  def create
    @finance_mode = FinanceMode.new(params[:finance_mode])
    @finance_mode.save

    render :json => @finance_mode
  end

  def edit
    @finance_mode = FinanceMode.find(params[:id])
    render :json => @finance_mode
  end

  def update
    @finance_mode = FinanceMode.find(params[:id])
    @finance_mode.update_attributes(params[:finance_mode])
    render :json => @finance_mode
  end
end
