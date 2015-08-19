class Admin::VehiclesController < ApplicationController
  respond_to :json

  def index
    @vehicles = Vehicle.all
    render :json => @vehicles
  end

  def show
    @vehicle = Vehicle.find(params[:id])

    render :json => @vehicle
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    @vehicle.save

    render :json => @vehicle
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    render :json => @vehicle
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update_attributes(params[:vehicle])
    render :json => @vehicle
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    render :json => @vehicle
  end
end
