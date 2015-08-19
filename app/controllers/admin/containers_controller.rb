class Admin::ContainersController < ApplicationController
  respond_to :json

  def index
    @containers = Container.all
    render :json => @containers
  end

  def show
    @container = Container.find(params[:id])

    render :json => @container
  end

  def new
    @container = Container.new
  end

  def create
    @container = Container.new(params[:container])
    @container.save

    render :json => @container
  end

  def edit
    @container = Container.find(params[:id])
    render :json => @container
  end

  def update
    @container = Container.find(params[:id])
    @container.update_attributes(params[:container])
    render :json => @container
  end

  def destroy
    @container= Container.find(params[:id])
    @container.destroy
    render :json => @container
  end
end
