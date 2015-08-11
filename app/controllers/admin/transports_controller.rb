class Admin::TransportsController < ApplicationController
  respond_to :json

  def index
    @transports = Transport.all
    respond_with @transports
  end

  def show
    @transport = Transport.find(params[:id])

    render :json => @transport
  end

  def new
    @transport = Transport.new
  end

  def create
    @transport = Transport.new(params[:transport])
    @transport.save

    render :json => @transport
  end

  def edit
    @transport = Transport.find(params[:id])
    render :json => @transport
  end

  def update
    @transport = Transport.find(params[:id])
    @transport.update_attributes(params[:transport])
    render :json => @transport
  end
end
