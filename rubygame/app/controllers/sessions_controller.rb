class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
     session[:user_id] = user.id
      redirect_to root_url, :notice => "successfull Logged in!"
    else
     redirect_to auth_index_path,:notice=> "Invalid email or password=> please try again"
    end
  end

  def destroy
    session[:user_id] = nil
    #redirect_to root_url, :notice => "succesfully logged out!"
    redirect_to auth_index_path, :notice => "succesfully logged out!"
    
  end
  #def create_session
    #user = User.from_omniauth(env["omniauth.auth"])
    #session[:user_id] = user.id
    #redirect_to users_show_path
  
  #end

  #def destroy_session
    #session[:user_id] = nil
    #redirect_to auth_index_path
 # end
end
