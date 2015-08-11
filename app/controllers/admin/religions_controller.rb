class Admin::ReligionsController < ApplicationController
  respond_to :json

  def index
    @religions = Religion.all
    respond_with @religions
  end

  def show
    @religion = Religion.find(params[:id])

    render :json => @religion
  end

  def new
    @religion = Religion.new
  end

  def create
    @religion = Religion.new(params[:religion])
    @religion.save

    render :json => @religion
  end

  def edit
    @religion = Religion.find(params[:id])
    render :json => @religion
  end

  def update
    @religion = Religion.find(params[:id])
    @religion.update_attributes(params[:religion])
    render :json => @religion
  end
end
