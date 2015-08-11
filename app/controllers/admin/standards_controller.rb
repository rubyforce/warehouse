class Admin::StandardsController < ApplicationController
  respond_to :json

  def index
    @standards = Standard.all
    render :json => @standards.as_json(:include => :fees_heads_standards)
  end

  def show
    @standard = Standard.find(params[:id])

    render :json => @standard.as_json(:include => :fees_heads_standards)
  end

  def new
    @standard = Standard.new
  end

  def create
    @standard = Standard.new(attributes)
    if params[:standard][:fees_heads_standards_attributes].blank?
      params[:standard].delete(:fees_heads_standards_attributes)
    end
    @standard.save

    render :json => @standard.as_json(:include => :fees_heads_standards)
  end

  def edit
    @standard = Standard.find(params[:id])
    render :json => @standard.as_json(:include => :fees_heads_standards)
  end

  def update
    @standard = Standard.find(params[:id])
    if params[:standard][:fees_heads_standards_attributes].blank?
      params[:standard].delete(:fees_heads_standards_attributes)
    end
    @standard.update_attributes(attributes)
    render :json => @standard.as_json(:include => :fees_heads_standards)
  end

  def attributes
    params[:standard]
  end
end
