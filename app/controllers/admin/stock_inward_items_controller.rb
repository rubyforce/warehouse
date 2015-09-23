class Admin::StockInwardItemsController < ApplicationController
  respond_to :json

  def index
    @stock_inward_items = StockInwardItem.all

    render :json => @stock_inward_items
  end

  def show
    @stock_inward_item = StockInwardItem.find(params[:id])

    render :json => @stock_inward_item
  end

  def new
    @stock_inward_item = StockInwardItem.new
  end

  def create
    @stock_inward_item = StockInwardItem.new(params[:stock_inward_item])
    @stock_inward_item.save

    render :json => @stock_inward_item
  end

  def edit
    @stock_inward_item = StockInwardItem.find(params[:id])

    render :json => @stock_inward_item
  end

  def update
    @stock_inward_item = StockInwardItem.find(params[:id])
    @stock_inward_item.update_attributes(params[:stock_inward_item])

    render :json => @stock_inward_item
  end

  def destroy
    @stock_inward_item = StockInwardItem.find(params[:id])
    @stock_inward_item.destroy

    render :json => @stock_inward_item
  end
end
