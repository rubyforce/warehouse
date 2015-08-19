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
    @vehicle = Vehicle.new(permitted_params)
    @vehicle.save

    render :json => @vehicle
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    render :json => @vehicle
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update_attributes(permitted_params)
    render :json => @vehicle
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    render :json => @vehicle
  end

  def permitted_params
    params[:vehicle].delete(:id)
    params[:vehicle].delete(:created_at)
    params[:vehicle].delete(:updated_at)
    params[:vehicle]
  end
end
