class Admin::AdmissionsController < ApplicationController
  respond_to :json

  def index
    @admissions = Admission.all
    respond_with @admissions
  end

  def show
    @admission = Admission.find(params[:id])

    render :json => @admission
  end

  def new
    @admission = Admission.new
  end

  def create
    @admission = Admission.new(params[:admission])
    @admission.save

    render :json => @admission
  end

  def edit
    @admission = Admission.find(params[:id])
    render :json => @admission
  end

  def update
    @admission = Admission.find(params[:id])
    @admission.update_attributes(params[:admission])
    render :json => @admission
  end
end
