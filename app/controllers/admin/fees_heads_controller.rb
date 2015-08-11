class Admin::FeesHeadsController < ApplicationController
  respond_to :json

  def index
    @fees_heads = FeesHead.all
    render :json => @fees_heads.as_json(:include => :fees_heads_standards)
  end

  def show
    @fees_head = FeesHead.find(params[:id])
    render :json => @fees_head
  end

  def new
    @fees_head = FeesHead.new
  end

  def create
    @fees_head = FeesHead.new(permitted_params)
    @fees_head.save

    render :json => @fees_head.as_json(:include => :fees_heads_standards)
  end

  def edit
    @fees_head = FeesHead.find(params[:id])
    render :json => @fees_head
  end

  def update
    @fees_head = FeesHead.find(params[:id])
    @fees_head.update_attributes(permitted_params)
    render :json => @fees_head.as_json(:include => :fees_heads_standards)
  end

  def destroy
    @fees_head = FeesHead.find(params[:id])
    @fees_head.destroy
    render :json => @fees_head
  end

  # TODO: permit only accessible params here. we don't need to permit all for security reasons.
  def permitted_params
    params[:fees_head].delete(:id)
    params[:fees_head].delete(:created_at)
    params[:fees_head].delete(:updated_at)
    params[:fees_head]
  end
end
