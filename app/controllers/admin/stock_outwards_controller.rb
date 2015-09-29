class Admin::StockOutwardsController < ApplicationController
  respond_to :json

  def index
    @stock_outwards = StockOutward.all

    render :json => @stock_outwards.as_json(:include => :stock_outward_items, :methods => :days_since_due)
  end

  def show
    @stock_outward = StockOutward.find(params[:id])

    render :json => @stock_outward
  end

  def new
    @stock_outward = StockOutward.new
  end

  def create
    @stock_outward = StockOutward.new(params[:stock_outward])
    @stock_outward.save

    render :json => @stock_outward
  end

  def edit
    @stock_outward = StockOutward.find(params[:id])

    render :json => @stock_outward
  end

  def update
    @stock_outward = StockOutward.find(params[:id])
    @stock_outward.update_attributes(params[:stock_outward])

    render :json => @stock_outward
  end

  def destroy
    @stock_outward = StockOutward.find(params[:id])
    @stock_outward.destroy

    render :json => @stock_outward
  end

  def outward_id
    @stock_outward = StockOutward.order('id asc').last

    render :json => @stock_outward
  end
end
