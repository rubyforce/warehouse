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
    @company = Company.new(params[:company])
    @company.save

    render :json => @company
  end

  def edit
    @company = Company.find(params[:id])
    render :json => @company
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(params[:company])
    render :json => @company
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    render :json => @company
  end
end
