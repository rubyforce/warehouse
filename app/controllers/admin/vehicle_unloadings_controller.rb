class Admin::VehicleUnloadingsController < ApplicationController
  respond_to :json

  def index
    @vehicle_unloadings = VehicleUnloading.all

    render :json => @vehicle_unloadings.as_json(:include => :vehicle_unloading_items)
  end

  def show
    @vehicle_unloading = VehicleUnloading.find(params[:id])

    render :json => @vehicle_unloading
  end

  def new
    @vehicle_unloading = VehicleUnloading.new
  end

  def create
    @vehicle_unloading = VehicleUnloading.new(params[:vehicle_unloading])
    @vehicle_unloading.save

    render :json => @vehicle_unloading
  end

  def edit
    @vehicle_unloading = VehicleUnloading.find(params[:id])

    render :json => @vehicle_unloading
  end

  def update
    @vehicle_unloading = VehicleUnloading.find(params[:id])
    @vehicle_unloading.update_attributes(params[:vehicle_unloading])

    render :json => @vehicle_unloading
  end

  def destroy
    @vehicle_unloading = VehicleUnloading.find(params[:id])
    @vehicle_unloading.destroy

    render :json => @vehicle_unloading
  end

  def vehicle_unloading_id
    @vehicle_unloading = VehicleUnloading.order('id asc').last

    render :json => @vehicle_unloading
  end

  def print
    @vehicle_unloading = VehicleUnloading.find(params[:id])

    render :layout => 'print'
  end
end
