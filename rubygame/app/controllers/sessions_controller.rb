class SessionsController < ApplicationController

  
  def google_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to users_show_path
  
  end

  def google_destroy
    session[:user_id] = nil
    redirect_to auth_index_path
  end
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "You are successfully Logged in!"
    else
      redirect_to auth_index_path, :notice => "Invalid email or password"
    end
  end
  
  

  def destroy
    log_out
    redirect_to auth_index_path, :notice => "You are successfully Logged out!"
  end
  
end
