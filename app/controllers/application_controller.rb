class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user


  def current_user
     @current_user ||= User.find(session[:user_id])
  end
  #helper method stores on cache only need to lookup once
  helper_method :current_user

#look @current user do something or
  def authenticate_user
     current_user
     #this was hard coded information from earlier
     #@current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to new_session_path and return false
  end

end
