class Admin::CategoriesController < ApplicationController
  respond_to :json

  def index
    @categories = Category.all
    render :json => @categories
  end

  def show
    @category = Category.find(params[:id])

    render :json => @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(permitted_params)
    @category.save

    render :json => @category
  end

  def edit
    @category = Category.find(params[:id])
    render :json => @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(permitted_params)
    render :json => @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render :json => @category
  end

  def permitted_params
    params[:category].delete(:id)
    params[:category].delete(:created_at)
    params[:category].delete(:updated_at)
    params[:category]
  end
end
