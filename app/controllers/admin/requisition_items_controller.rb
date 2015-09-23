class Admin::RequisitionItemsController < ApplicationController
  respond_to :json

  def index
    @requisition_items = RequisitionItem.all
    render :json => @requisition_items.as_json(
      :include => [
        {
          :item => {
            :only => [:id, :name]
          }
        },
        {
          :company => {
            :only => [:id, :name]
          }
        },
        {
          :warehouse => {
            :only =>[:id, :name]
          }
        }
    ])
  end

  def show
    @requisition_item = RequisitionItem.find(params[:id])

    render :json => @requisition_item
  end

  def new
    @requisition_item = RequisitionItem.new
  end

  def create
    @requisition_item = RequisitionItem.new(params[:requisition_item])
    @requisition_item.save

    render :json => @requisition_item
  end

  def edit
    requisition_item = RequisitionItem.find(params[:id])
    render :json => @requisition_item
  end

  def update
    @requisition_item = RequisitionItem.find(params[:id])

    attributes = params[:requisition_item] || {}
    @requisition_item.update_attributes!(qty: attributes[:qty])

    render :json => @requisition_item
  end
end
