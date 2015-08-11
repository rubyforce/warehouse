class Admin::PlaceOfBirthsController < ApplicationController
  respond_to :json

  def index
    @place_of_births = PlaceOfBirth.all
    respond_with @place_of_births
  end

  def show
    @place_of_birth = PlaceOfBirth.find(params[:id])

    render :json => @place_of_birth
  end

  def new
    @place_of_birth = PlaceOfBirth.new
  end

  def create
    @place_of_birth = PlaceOfBirth.new(params[:place_of_birth])
    @place_of_birth.save

    render :json => @place_of_birth
  end

  def edit
    @place_of_birth = PlaceOfBirth.find(params[:id])
    render :json => @place_of_birth
  end

  def update
    @place_of_birth = PlaceOfBirth.find(params[:id])
    @place_of_birth.update_attributes(params[:place_of_birth])
    render :json => @place_of_birth
  end
end
