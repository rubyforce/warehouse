class Admin::FeesHeadRecurrencesController < ApplicationController
  respond_to :json

  def index
    @fees_head_recurrences = FeesHeadRecurrence.all
    respond_with @fees_head_recurrences
  end

  def show
    @fees_head_recurrence = FeesHeadRecurrence.find(params[:id])

    render :json => @fees_head_recurrence
  end

  def new
    @fees_head_recurrence = FeesHeadRecurrence.new
  end

  def create
    @fees_head_recurrence = FeesHeadRecurrence.new(params[:fees_head_recurrence])
    @fees_head_recurrence.save

    render :json => @fees_head_recurrence
  end

  def edit
    @fees_head_recurrence = FeesHeadRecurrence.find(params[:id])
    render :json => @fees_head_recurrence
  end

  def update
    @fees_head_recurrence = FeesHeadRecurrence.find(params[:id])
    @fees_head_recurrence.update_attributes(params[:fees_head_recurrence])
    render :json => @fees_head_recurrence
  end

  def destroy
    @fees_head_recurrence = FeesHeadRecurrence.find(params[:id])
    @fees_head_recurrence.destroy
    render :json => @fees_head_recurrence
  end
end
