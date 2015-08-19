class Admin::CompaniesController < ApplicationController
  respond_to :json

  def index
    @companies = Company.all
    render :json => @companies
  end

  def show
    @company = Company.find(params[:id])

    render :json => @company
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(permitted_params)
    @company.save

    render :json => @company
  end

  def edit
    @company = Company.find(params[:id])
    render :json => @company
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(permitted_params)
    render :json => @company
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    render :json => @company
  end

  def permitted_params
    params[:company].delete(:id)
    params[:company].delete(:created_at)
    params[:company].delete(:updated_at)
    params[:company]
  end
end
