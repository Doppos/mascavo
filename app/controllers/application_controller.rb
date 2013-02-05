class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :current_account

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_account
    @current_account ||=  current_user.accounts.first
  end

end
