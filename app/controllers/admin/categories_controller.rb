class Admin::CategoriesController < ApplicationController
  respond_to :json

  def index
    @categories = Category.all
    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])

    render :json => @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    @category.save

    render :json => @category
  end

  def edit
    @category = Category.find(params[:id])
    render :json => @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    render :json => @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render :json => @category
  end
end
