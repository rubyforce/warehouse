class Admin::GrievancesController < ApplicationController
  respond_to :json

  def index
    @grievances = Grievance.all
    render :json => @grievances.as_json(:include => :reasons)
  end

  def show
    @grievance = Grievance.find(params[:id])

    render :json => @grievance
  end

  def new
    @grievance = Grievance.new
  end

  def create
    @grievance = Grievance.new(permitted_params)
    @grievance.save

    render :json => @grievance.as_json(:include => :reasons)
  end

  def edit
    @grievance = Grievance.find(params[:id])
    render :json => @grievance
  end

  def update
    @grievance = Grievance.find(params[:id])
    @grievance.update_attributes(permitted_params)
    render :json => @grievance
  end

  def destroy
    @grievance = Grievance.find(params[:id])
    @grievance.destroy
    render :json => @grievance
  end

  def permitted_params
    params[:grievance].delete(:id)
    params[:grievance].delete(:created_at)
    params[:grievance].delete(:updated_at)
    params[:grievance]
  end

  def grievance_id
    @grievance = Grievance.order('id asc').last
    render :json => @grievance
  end
end
