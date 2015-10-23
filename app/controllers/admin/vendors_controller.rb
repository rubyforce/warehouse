class Admin::VendorsController < ApplicationController
  respond_to :json

  def index
    @vendors = Vendor.all
    render :json => @vendors
  end

  def show
    @vendor = Vendor.find(params[:id])

    render :json => @vendor
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(permitted_params)
    @vendor.save

    render :json => @vendor
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :json => @vendor
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update_attributes(permitted_params)
    render :json => @vendor
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    render :json => @vendor
  end

  def permitted_params
    params[:vendor].delete(:id)
    params[:vendor].delete(:created_at)
    params[:vendor].delete(:updated_at)
    params[:vendor]
  end
end
