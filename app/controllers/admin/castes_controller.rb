class Admin::CastesController < ApplicationController
  respond_to :json

  def index
    @castes = Caste.all
    respond_with @castes
  end

  def show
    @caste = Caste.find(params[:id])

    render :json => @caste
  end

  def new
    @caste = Caste.new
  end

  def create
    @caste = Caste.new(params[:caste])
    @caste.save

    render :json => @caste
  end

  def edit
    @caste = Caste.find(params[:id])
    render :json => @caste
  end

  def update
    @caste = Caste.find(params[:id])
    @caste.update_attributes(params[:caste])
    render :json => @caste
  end
end
