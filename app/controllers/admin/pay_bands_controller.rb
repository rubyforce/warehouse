class Admin::PayBandsController < ApplicationController
  respond_to :json

  def index
    @pay_bands = PayBand.all
    respond_with @pay_bands
  end

  def show
    @pay_band = PayBand.find(params[:id])

    render :json => @pay_band
  end

  def new
    @pay_band = PayBand.new
  end

  def create
    @pay_band = PayBand.new(params[:pay_band])
    @pay_band.save

    render :json => @pay_band
  end

  def edit
    @pay_band = PayBand.find(params[:id])
    render :json => @pay_band
  end

  def update
    @pay_band = PayBand.find(params[:id])
    @pay_band.update_attributes(params[:pay_band])
    render :json => @pay_band
  end

  def destroy
    @pay_band= PayBand.find(params[:id])
    @pay_band.destroy
    render :json => @pay_band
  end
end
