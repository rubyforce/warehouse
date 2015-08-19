class Admin::DevicesController < ApplicationController
  respond_to :json

  def index
    @devices = Device.all
    render :json => @devices
  end

  def show
    @device = Device.find(params[:id])

    render :json => @device
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(permitted_params)
    @device.save

    render :json => @device
  end

  def edit
    @device = Device.find(params[:id])
    render :json => @device
  end

  def update
    @device = Device.find(params[:id])
    @device.update_attributes(permitted_params)
    render :json => @device
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    render :json => @device
  end

  def permitted_params
    params[:device].delete(:id)
    params[:device].delete(:created_at)
    params[:device].delete(:updated_at)
    params[:device]
  end
end
