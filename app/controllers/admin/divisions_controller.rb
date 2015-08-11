class Admin::DivisionsController < ApplicationController
  respond_to :json

  def index
    @divisions = Division.all
    respond_with @divisions
  end

  def show
    @division = Division.find(params[:id])

    render :json => @division
  end

  def new
    @division = Division.new
  end

  def create
    @division = Division.new(params[:division])
    @division.save

    render :json => @division
  end

  def edit
    @division = Division.find(params[:id])
    render :json => @division
  end

  def update
    @division = Division.find(params[:id])
    @division.update_attributes(params[:division])
    render :json => @division
  end
end
