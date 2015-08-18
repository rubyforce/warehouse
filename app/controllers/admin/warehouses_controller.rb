class Admin::WarehousesController < ApplicationController
  respond_to :json

  def index
    @warehouses = Warehouse.all
    respond_with @warehouses
  end

  def show
    @warehouse = Warehouse.find(params[:id])

    render :json => @warehouse
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(params[:warehouse])
    @warehouse.save

    render :json => @warehouse
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
    render :json => @warehouse
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    @warehouse.update_attributes(params[:warehouse])
    render :json => @warehouse
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy
    render :json => @warehouse
  end
end
