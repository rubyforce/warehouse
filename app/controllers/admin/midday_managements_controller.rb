class Admin::MiddayManagementsController < ApplicationController
  respond_to :json

  def index
    @midday_managements = MiddayManagement.all
    respond_with @midday_managements
  end

  def show
    @midday_management = MiddayManagement.find(params[:id])

    render :json => @midday_management
  end

  def new
    @midday_management = MiddayManagement.new
  end

  def create
    @midday_management = MiddayManagement.new(params[:midday_management])
    @midday_management.save

    render :json => @midday_management
  end

  def edit
    @midday_management = MiddayManagement.find(params[:id])
    render :json => @midday_management
  end

  def update
    @midday_management = MiddayManagement.find(params[:id])
    @midday_management.update_attributes(params[:midday_management])
    render :json => @midday_management
  end

  def destroy
    @midday_management = MiddayManagement.find(params[:id])
    @midday_management.destroy
    render :json => @midday_management
  end
end
