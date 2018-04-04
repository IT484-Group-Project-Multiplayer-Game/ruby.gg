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
end
