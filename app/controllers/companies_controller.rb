class CompaniesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :aditional_create_params, :only => :create
  before_filter :aditional_update_params, :only => :update

  def index
    if params[:status]
      @companies = Company.where("status = ?", params[:status])
    else
      @companies = Company.all
    end
  end

  def show
    @company = Company.find(params[:id])
    params[:tab] ||= "details"
  end

  def new
    @company = Company.new :public => true, :active => true
    @company.jobs.build
    @company.contact_infos.build
    @company.online_infos.build
    @company.document_infos.build
    @company.address_infos.build
  end

  def edit
    @company = Company.find(params[:id])
    @company.jobs.build if @company.jobs.empty?
    @company.contact_infos.build if @company.contact_infos.empty?
    @company.online_infos.build if @company.online_infos.empty?
    @company.document_infos.build if @company.document_infos.empty?
    @company.address_infos.build if @company.address_infos.empty?
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, :notice => I18n.t(:'message.company_was_successfully_created')
    else
      render :action => "new"
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice => I18n.t(:'message.company_was_successfully_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    # delete or set active = false ?
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_url
  end

  private
    def aditional_create_params
      params[:company][:created_by] = params[:company][:updated_by] = current_user.id
      params[:company][:account_id] = current_account.id
    end

    def aditional_update_params
      params[:company][:updated_by] = current_user.id
    end

end
