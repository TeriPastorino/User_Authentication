class SessionsController < ApplicationController
  #show login form
  
  skip_before_filter :authenticate_user, only: [:new, :create]

  def new
  end

#login  
#store user id in session
#session

  def create
    if session[:user_id] = authenticated_user_id
      redirect_to root_path
    else 
      flash[:alert] = "Email or Password is incorrect"
      redirect_to new_session_path
    end
  end

#logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def authenticated_user_id
    user_from_email.id
  end

  def user_from_email
    user_or_null.tap do |user|
      return NullObject.new unless user.verify_password(params[:password])
    end
  end

  def user_or_null
    User.find_by_email(params[:email]) || NullObject.new
  end

end

class AuthenticationError<StandardError

end

