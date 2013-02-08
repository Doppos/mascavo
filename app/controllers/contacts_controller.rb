class ContactsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :aditional_create_params, :only => :create
  before_filter :aditional_update_params, :only => :update

  def index
    if params[:status]
      @contacts = Contact.where("status = ?", params[:status])
    else
      @contacts = Contact.all
    end
  end

  def show
    @contact = Contact.find(params[:id])
    params[:tab] ||= "details"
  end

  def new
    @contact = Contact.new :public => true, :active => true
    @contact.jobs.build
    @contact.contact_infos.build
    @contact.online_infos.build
    @contact.document_infos.build
    @contact.address_infos.build
  end

  def edit
    @contact = Contact.find(params[:id])
    @contact.jobs.build if @contact.jobs.empty?
    @contact.contact_infos.build if @contact.contact_infos.empty?
    @contact.online_infos.build if @contact.online_infos.empty?
    @contact.document_infos.build if @contact.document_infos.empty?
    @contact.address_infos.build if @contact.address_infos.empty?
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to @contact, :notice => I18n.t(:'message.contact_was_successfully_created')
    else
      render :action => "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, :notice => I18n.t(:'message.contact_was_successfully_updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    # delete or set active = false ?
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url
  end

  private
    def aditional_create_params
      params[:contact][:created_by] = params[:contact][:updated_by] = current_user.id
      params[:contact][:account_id] = current_account.id
    end

    def aditional_update_params
      params[:contact][:updated_by] = current_user.id
    end

end
