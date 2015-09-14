class Admin::RequisitionsController < ApplicationController
  respond_to :json

  def index
    @requisitions = Requisition.all
    render :json => @requisitions
  end

  def show
    @requisition = Requisition.find(params[:id])

    render :json => @requisition
  end

  def new
    @requisition = Requisition.new
  end

  def create
    @requisition = Requisition.new(permitted_params)
    @requisition.save

    render :json => @requisition
  end

  def edit
    @requisition = Requisition.find(params[:id])
    render :json => @requisition
  end

  def update
    @requisition = Requisition.find(params[:id])
    @requisition.update_attributes(permitted_params)
    render :json => @requisition
  end

  def destroy
    @requisition = Requisition.find(params[:id])
    @requisition.destroy
    render :json => @requisition
  end

  def permitted_params
    params[:requisition].delete(:id)
    params[:requisition].delete(:created_at)
    params[:requisition].delete(:updated_at)
    params[:requisition]
  end

  def requisition_id
    @requisition = Requisition.order('id asc').last
    render :json => @requisition
  end
end
