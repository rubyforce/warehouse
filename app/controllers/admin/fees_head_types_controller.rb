class Admin::FeesHeadTypesController < ApplicationController
  respond_to :json

  def index
    @fees_head_types = FeesHeadType.all
    respond_with @fees_head_types
  end

  def show
    @fees_head_type = FeesHeadType.find(params[:id])

    render :json => @fees_head_type
  end

  def new
    @fees_head_type = FeesHeadType.new
  end

  def create
    @fees_head_type = FeesHeadType.new(params[:fees_head_type])
    @fees_head_type.save

    render :json => @fees_head_type
  end

  def edit
    @fees_head_type = FeesHeadType.find(params[:id])
    render :json => @fees_head_type
  end

  def update
    @fees_head_type = FeesHeadType.find(params[:id])
    @fees_head_type.update_attributes(params[:fees_head_type])
    render :json => @fees_head_type
  end

  def destroy
    @fees_head_type = FeesHeadType.find(params[:id])
    @fees_head_type.destroy
    render :json => @fees_head_type
  end
end
