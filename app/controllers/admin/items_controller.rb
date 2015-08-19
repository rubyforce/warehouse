class Admin::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    render :json => @items
  end

  def show
    @item = Item.find(params[:id])
    render :json => @item
  end

  def print
    @item = Item.find(params[:id])
    render :layout => 'print'
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.save
    render :json => @item
  end

  def edit
    @item = Item.find(params[:id])
    render :json => @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    render :json => @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render :json => @item
  end
end
