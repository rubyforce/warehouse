class Admin::AcademicYearsController < ApplicationController
  respond_to :json

  def index
    @academic_years = AcademicYear.all
    respond_with @academic_years
  end

  def show
    @academic_year = AcademicYear.find(params[:id])

    render :json => @academic_year
  end

  def new
    @academic_year = AcademicYear.new
  end

  def create
    @academic_year = AcademicYear.new(params[:academic_year])
    @academic_year.save

    render :json => @academic_year
  end

  def edit
    @academic_year = AcademicYear.find(params[:id])
    render :json => @academic_year
  end

  def update
    @academic_year = AcademicYear.find(params[:id])
    @academic_year.update_attributes(params[:academic_year])
    render :json => @academic_year
  end
end
