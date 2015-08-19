class Admin::RateMastersController < ApplicationController
  respond_to :json

  def index
    @rate_masters = RateMaster.all
    render :json => @categories
  end

  def show
    @rate_master = RateMaster.find(params[:id])

    render :json => @rate_master
  end

  def new
    @rate_master = RateMaster.new
  end

  def create
    @rate_master = RateMaster.new(permitted_params)
    @rate_master.save

    render :json => @rate_master
  end

  def edit
    @rate_master = RateMaster.find(params[:id])
    render :json => @rate_master
  end

  def update
    @rate_master = RateMaster.find(params[:id])
    @rate_master.update_attributes(permitted_params)
    render :json => @rate_master
  end

  def destroy
    @rate_master = RateMaster.find(params[:id])
    @rate_master.destroy
    render :json => @rate_master
  end

  def permitted_params
    params[:device].delete(:id)
    params[:device].delete(:created_at)
    params[:device].delete(:updated_at)
    params[:device]
  end
end
