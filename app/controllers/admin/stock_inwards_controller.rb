class Admin::StockInwardsController < ApplicationController
  respond_to :json

  def index
    @stock_inwards = StockInward.all

    render :json => @stock_inwards
  end

  def show
    @stock_inward = StockInward.find(params[:id])

    render :json => @stock_inward
  end

  def new
    @stock_inward = StockInward.new
  end

  def create
    @stock_inward = StockInward.new(params[:stock_inward])
    @stock_inward.save

    render :json => @stock_inward
  end

  def edit
    @stock_inward = StockInward.find(params[:id])

    render :json => @stock_inward
  end

  def update
    @stock_inward = StockInward.find(params[:id])
    @stock_inward.update_attributes(params[:stock_inward])

    render :json => @stock_inward
  end

  def destroy
    @stock_inward = StockInward.find(params[:id])
    @stock_inward.destroy

    render :json => @stock_inward
  end
end
