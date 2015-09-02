class Admin::ReasonsController < ApplicationController
  respond_to :json

  def index
    @reasons = Reason.all
    render :json => @reasons.as_json(:include => [{
      :item => {
        :only => [:id, :name]
      }
    }])
  end

  def show
    @reason = Reason.find(params[:id])

    render :json => @reason
  end

  def new
    @reason = Reason.new
  end

  def create
    @reason = Reason.new(params[:reason])
    @reason.save

    render :json => @reason
  end

  def edit
    @reason = Reason.find(params[:id])
    render :json => @reason
  end

  def update
    @reason = Reason.find(params[:id])

    attributes = params[:reason] || {}
    @reason.update_attributes!(qty: attributes[:qty])

    render :json => @reason
  end
end
