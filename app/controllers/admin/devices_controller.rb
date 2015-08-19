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
    @device = Device.new(params[:device])
    @device.save

    render :json => @device
  end

  def edit
    @device = Device.find(params[:id])
    render :json => @device
  end

  def update
    @device = Device.find(params[:id])
    @device.update_attributes(params[:device])
    render :json => @device
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    render :json => @device
  end
end
