class Admin::PackageTypesController < ApplicationController
  respond_to :json

  def index
    @package_types = PackageType.all
    respond_with @package_types
  end

  def show
    @package_type = PackageType.find(params[:id])

    render :json => @package_type
  end

  def new
    @package_type = PackageType.new
  end

  def create
    @package_type = PackageType.new(params[:package_type])
    @package_type.save

    render :json => @package_type
  end

  def edit
    @package_type = PackageType.find(params[:id])
    render :json => @package_type
  end

  def update
    @package_type = PackageType.find(params[:id])
    @package_type.update_attributes(params[:package_type])
    render :json => @package_type
  end

  def destroy
    @package_type= PackageType.find(params[:id])
    @package_type.destroy
    render :json => @package_type
  end
end
