class Admin::SectionsController < ApplicationController
  respond_to :json

  def index
    @sections = Section.all
    respond_with @sections
  end

  def show
    @section = Section.find(params[:id])

    render :json => @section
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(params[:section])
    @section.save

    render :json => @section
  end

  def edit
    @section = Section.find(params[:id])
    render :json => @section
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(params[:section])
    render :json => @section
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    render :json => @section
  end
end
