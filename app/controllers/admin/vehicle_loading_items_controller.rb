class Admin::VehicleLoadingItemsController < ApplicationController
  respond_to :json

  def index
    @vehicle_loading_items = VehicleLoadingItem.all

    render :json => @vehicle_loading_items
  end

  def show
    @vehicle_loading_item = VehicleLoadingItem.find(params[:id])

    render :json => @vehicle_loading_item
  end

  def new
    @vehicle_loading_item = VehicleLoadingItem.new
  end

  def create
    @vehicle_loading_item = VehicleLoadingItem.new(params[:vehicle_loading_item])
    @vehicle_loading_item.save

    render :json => @vehicle_loading_item
  end

  def edit
    @vehicle_loading_item = VehicleLoadingItem.find(params[:id])

    render :json => @vehicle_loading_item
  end

  def update
    @vehicle_loading_item = VehicleLoadingItem.find(params[:id])
    @vehicle_loading_item.update_attributes(params[:vehicle_loading_item])

    render :json => @vehicle_loading_item
  end

  def destroy
    @vehicle_loading_item = VehicleLoadingItem.find(params[:id])
    @vehicle_loading_item.destroy

    render :json => @vehicle_loading_item
  end
end
