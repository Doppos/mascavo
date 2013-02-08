class SourcesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :aditional_create_params, :only => :create
  before_filter :aditional_update_params, :only => :update

  def index
    if params[:status]
      @sources = Source.where("status = ?", params[:status])
    else
      @sources = Source.all
    end
  end

  def show
    @source = Source.find(params[:id])
    params[:tab] ||= "details"
  end

  def new
    @source = Source.new :active => true
  end

  def edit
    @source = Source.find(params[:id])
  end

  def create
    @source = Source.new(params[:source])
    if @source.save
      redirect_to @source, :notice => I18n.t(:'message.source_was_successfully_created')
    else
      render :action => "new"
    end
  end

  def update
    @source = Source.find(params[:id])
    if @source.update_attributes(params[:source])
      redirect_to @source, :notice => I18n.t(:'message.source_was_successfully_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    # delete or set active = false ?
    @source = Source.find(params[:id])
    @source.destroy
    redirect_to sources_url
  end

  private
    def aditional_create_params
      params[:source][:created_by] = params[:source][:updated_by] = current_user.id
      params[:source][:account_id] = current_account.id
    end

    def aditional_update_params
      params[:source][:updated_by] = current_user.id
    end

end
