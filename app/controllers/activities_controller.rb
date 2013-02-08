class ActivitiesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :aditional_create_params, :only => :create
  before_filter :aditional_update_params, :only => :update

  def index
    if params[:status]
      @activities = Activity.where("status = ?", params[:status])
    else
      @activities = Activity.all
    end
  end

  def show
    @activity = Activity.find(params[:id])
    params[:tab] ||= "details"
  end

  def new
    @activity = Activity.new
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      redirect_to @activity, :notice => I18n.t(:'message.activity_was_successfully_created')
    else
      render :action => "new"
    end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(params[:activity])
      redirect_to @activity, :notice => I18n.t(:'message.activity_was_successfully_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    # delete or set active = false ?
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_url
  end

  private
    def aditional_create_params
      params[:activity][:created_by] = params[:activity][:updated_by] = current_user.id
      params[:activity][:account_id] = current_account.id
    end

    def aditional_update_params
      params[:activity][:updated_by] = current_user.id
    end

end
