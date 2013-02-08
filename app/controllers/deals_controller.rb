class DealsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :aditional_create_params, :only => :create
  before_filter :aditional_update_params, :only => :update

  def index
    if params[:status]
      @deals = Deal.where("status = ?", params[:status])
    else
      @deals = Deal.all
    end
  end

  def show
    @deal = Deal.find(params[:id])
    params[:tab] ||= "details"
  end

  def new
    @deal = Deal.new
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def create
    @deal = Deal.new(params[:deal])
    if @deal.save
      redirect_to @deal, :notice => I18n.t(:'message.deal_was_successfully_created')
    else
      render :action => "new"
    end
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(params[:deal])
      redirect_to @deal, :notice => I18n.t(:'message.deal_was_successfully_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    # delete or set active = false ?
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to deals_url
  end

  private
    def aditional_create_params
      params[:deal][:created_by] = params[:deal][:updated_by] = current_user.id
      params[:deal][:account_id] = current_account.id
    end

    def aditional_update_params
      params[:deal][:updated_by] = current_user.id
    end

end
