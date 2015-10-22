class Admin::VehicleLoadingsController < ApplicationController
  respond_to :json

  def index
    @vehicle_loadings = VehicleLoading.all

    render :json => @vehicle_loadings.as_json(:include => :vehicle_loading_items)
  end

  def show
    @vehicle_loading = VehicleLoading.find(params[:id])

    render :json => @vehicle_loading
  end

  def new
    @vehicle_loading = VehicleLoading.new
  end

  def create
    @vehicle_loading = VehicleLoading.new(params[:vehicle_loading])
    @vehicle_loading.save

    render :json => @vehicle_loading
  end

  def edit
    @vehicle_loading = VehicleLoading.find(params[:id])

    render :json => @vehicle_loading
  end

  def update
    @vehicle_loading = VehicleLoading.find(params[:id])
    @vehicle_loading.update_attributes(params[:vehicle_loading])

    render :json => @vehicle_loading
  end

  def destroy
    @vehicle_loading = VehicleLoading.find(params[:id])
    @vehicle_loading.destroy

    render :json => @vehicle_loading
  end

  def vehicle_loading_id
    @vehicle_loading = VehicleLoading.order('id asc').last

    render :json => @vehicle_loading
  end

  def print
    @vehicle_loading = VehicleLoading.find(params[:id])

    render :layout => 'print'
  end
end
