class SessionsController < ApplicationController

  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to users_show_path
  
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
  
  def new
  end
  
  def native_create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to summoner_index_path, :notice => "You are successfully Logged in!"
    else
      flash.now.alert = "Invalid email or  Invalid password"
      render "new"
    end
  end
  
  

  def native_destroy
    log_out
    redirect_to sessions_new_path, :notice => "You are successfully Logged out!"
  end
  
end
