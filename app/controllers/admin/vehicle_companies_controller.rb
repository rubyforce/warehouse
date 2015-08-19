class Admin::VehicleCompaniesController < ApplicationController
  respond_to :json

  def index
    @vehicle_companies = VehicleCompany.all
    render :json => @vehicle_companies
  end

  def show
    @vehicle_company = VehicleCompany.find(params[:id])

    render :json => @vehicle_company
  end

  def new
    @vehicle_company = VehicleCompany.new
  end

  def create
    @vehicle_company = VehicleCompany.new(params[:vehicle_company])
    @vehicle_company.save

    render :json => @vehicle_company
  end

  def edit
    @vehicle_company = VehicleCompany.find(params[:id])
    render :json => @vehicle_company
  end

  def update
    @vehicle_company = VehicleCompany.find(params[:id])
    @vehicle_company.update_attributes(params[:vehicle_company])
    render :json => @vehicle_company
  end

  def destroy
    @vehicle_company= VehicleCompany.find(params[:id])
    @vehicle_company.destroy
    render :json => @vehicle_company
  end
end
