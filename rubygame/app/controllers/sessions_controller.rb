class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to users_show_path
  
  end

  def destroy
    session[:user_id] = nil
    redirect_to auth_index_path
  end
  
  def new
  end

  def native_create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to users_show_path, :notice => "You are successfully Logged in!"
    else
      flash.now.alert = "Invalid email or  invalic password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to users_new_path, :notice => "you are successfully Logged out!"
  end
end
