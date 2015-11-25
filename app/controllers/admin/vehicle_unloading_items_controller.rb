class Admin::VehicleUnloadingItemsController < ApplicationController
  respond_to :json

  def index
    @vehicle_unloading_items = VehicleUnloadingItem.all

    render :json => @vehicle_unloading_items
  end

  def show
    @vehicle_unloading_item = VehicleUnloadingItem.find(params[:id])

    render :json => @vehicle_unloading_item
  end

  def new
    @vehicle_unloading_item = VehicleUnloadingItem.new
  end

  def create
    @vehicle_unloading_item = VehicleUnloadingItem.new(params[:vehicle_unloading_item])
    @vehicle_unloading_item.save

    render :json => @vehicle_unloading_item
  end

  def edit
    @vehicle_unloading_item = VehicleUnloadingItem.find(params[:id])

    render :json => @vehicle_unloading_item
  end

  def update
    @vehicle_unloading_item = VehicleUnloadingItem.find(params[:id])
    @vehicle_unloading_item.update_attributes(params[:vehicle_unloading_item])

    render :json => @vehicle_unloading_item
  end

  def destroy
    @vehicle_unloading_item = VehicleUnloadingItem.find(params[:id])
    @vehicle_unloading_item.destroy

    render :json => @vehicle_unloading_item
  end
end
