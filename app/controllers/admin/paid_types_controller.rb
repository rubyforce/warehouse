class Admin::PaidTypesController < ApplicationController
  respond_to :json

  def index
    @paid_types = PaidType.all
    render :json => @paid_types
  end

  def show
    @paid_type = PaidType.find(params[:id])

    render :json => @paid_type
  end

  def new
    @paid_type = PaidType.new
  end

  def create
    @paid_type = PaidType.new(params[:paid_type])
    @paid_type.save

    render :json => @paid_type
  end

  def edit
    @paid_type = PaidType.find(params[:id])
    render :json => @paid_type
  end

  def update
    @paid_type = PaidType.find(params[:id])
    @paid_type.update_attributes(params[:paid_type])
    render :json => @paid_type
  end

  def destroy
    @paid_type= PaidType.find(params[:id])
    @paid_type.destroy
    render :json => @paid_type
  end
end
