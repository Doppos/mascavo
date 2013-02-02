class ContactsController < ApplicationController

  before_filter :authenticate_user!

  def index
    if params[:status]
      @contacts = Contact.where("status = ?", params[:status])
    else
      @contacts = Contact.all
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    @contact.jobs.build
    @contact.contact_infos.build
    @contact.online_infos.build
    @contact.document_infos.build
    @contact.address_infos.build
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to @contact, :notice => I18n.t(:contact_was_successfully_created)
    else
      render :action => "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, :notice => I18n.t(:contact_was_successfully_updated)
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

end
