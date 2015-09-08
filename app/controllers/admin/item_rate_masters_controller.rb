class Admin::ItemRateMastersController < ApplicationController
  respond_to :json

  def index
    @item_rate_masters = ItemRateMaster.all
    render :json => @item_rate_masters
  end

  def show
    @item_rate_master = ItemRateMaster.find(params[:id])

    render :json => @item_rate_master
  end

  def new
    @item_rate_master = ItemRateMaster.new
  end

  def create
    @item_rate_master = ItemRateMaster.new(permitted_params)
    @item_rate_master.save

    render :json => @item_rate_master
  end

  def edit
    @item_rate_master = ItemRateMaster.find(params[:id])
    render :json => @item_rate_master
  end

  def update
    @item_rate_master = ItemRateMaster.find(params[:id])
    @item_rate_master.update_attributes(permitted_params)
    render :json => @item_rate_master
  end

  def destroy
    @item_rate_master = ItemRateMaster.find(params[:id])
    @item_rate_master.destroy
    render :json => @item_rate_master
  end

  def permitted_params
    params[:item_rate_master].delete(:id)
    params[:item_rate_master].delete(:created_at)
    params[:item_rate_master].delete(:updated_at)
    params[:item_rate_master]
  end
end
