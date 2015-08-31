class Admin::RateMastersController < ApplicationController
  respond_to :json

  def index
    @rate_masters = RateMaster.all
    render :json => @rate_masters.as_json(:include => :item_rate_masters)
  end

  def show
    @rate_master = RateMaster.find(params[:id])

    render :json => @rate_master.as_json(:include => :item_rate_masters)
  end

  def new
    @rate_master = RateMaster.new
  end

  def create
    @rate_master = RateMaster.new(permitted_params)
    @rate_master.save

    render :json => @rate_master.as_json(:include => :item_rate_masters)
  end

  def edit
    @rate_master = RateMaster.find(params[:id])
    render :json => @rate_master.as_json(:include => :item_rate_masters)
  end

  def update
    @rate_master = RateMaster.find(params[:id])
    @rate_master.update_attributes(permitted_params)
    render :json => @rate_master.as_json(:include => :item_rate_masters)
  end

  def destroy
    @rate_master = RateMaster.find(params[:id])
    @rate_master.destroy
    render :json => @rate_master.as_json(:include => :item_rate_masters)
  end

  def permitted_params
    params[:rate_master].delete(:id)
    params[:rate_master].delete(:created_at)
    params[:rate_master].delete(:updated_at)
    params[:rate_master]
  end
end
