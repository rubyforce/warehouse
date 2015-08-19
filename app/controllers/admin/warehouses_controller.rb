class Admin::WarehousesController < ApplicationController
  respond_to :json

  def index
    @warehouses = Warehouse.all
    render :json => @warehouses
  end

  def show
    @warehouse = Warehouse.find(params[:id])

    render :json => @warehouse
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(permitted_params)
    @warehouse.save

    render :json => @warehouse
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
    render :json => @warehouse
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    @warehouse.update_attributes(permitted_params)
    render :json => @warehouse
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy
    render :json => @warehouse
  end

  def permitted_params
    params[:warehouse].delete(:id)
    params[:warehouse].delete(:created_at)
    params[:warehouse].delete(:updated_at)
    params[:warehouse]
  end
end
