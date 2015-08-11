class Admin::NaturesController < ApplicationController
  respond_to :json

  def index
    @natures = Nature.all
    respond_with @natures
  end

  def show
    @nature = Nature.find(params[:id])

    render :json => @nature
  end

  def new
    @nature = Nature.new
  end

  def create
    @nature = Nature.new(params[:nature])
    @nature.save

    render :json => @nature
  end

  def edit
    @nature = Nature.find(params[:id])
    render :json => @nature
  end

  def update
    @nature = Nature.find(params[:id])
    @nature.update_attributes(params[:nature])
    render :json => @nature
  end

  def destroy
    @nature = Nature.find(params[:id])
    @nature.destroy
    render :json => @nature
  end
end
