class ApplicationController < ActionController::Base

  # before_filter :special_params, :only => :create

  protect_from_forgery

  helper_method :current_account

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_account
    @current_account ||=  current_user.accounts.first
  end

  def special_params
    params[:created_by] = params[:updated_by] = current_user
    params[:updated_by] = current_user
    params[:account_id] = current_account.id
  end

end
