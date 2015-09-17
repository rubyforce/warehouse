class StockOutwardItemsController < ApplicationController
  respond_to :json

  def index
    @stock_outward_items = StockOutwardItem.all

    render :json => @stock_outward_items
  end

  def show
    @stock_outward_item = StockOutwardItem.find(params[:id])

    render :json => @stock_outward_item
  end

  def new
    @stock_outward_item = StockOutwardItem.new
  end

  def create
    @stock_outward_item = StockOutwardItem.new(params[:stock_outward_item])
    @stock_outward_item.save

    render :json => @stock_outward_item
  end

  def edit
    @stock_outward_item = StockOutwardItem.find(params[:id])

    render :json => @stock_outward_item
  end

  def update
    @stock_outward_item = StockOutwardItem.find(params[:id])
    @stock_outward_item.update_attributes(params[:stock_outward_item])

    render :json => @stock_outward_item
  end

  def destroy
    @stock_outward_item = StockOutwardItem.find(params[:id])
    @stock_outward_item.destroy

    render :json => @stock_outward_item
  end
end
