class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        params.permit!
        @user = User.new(params[:user])
        @email = params[:user][:email]
        @password = params[:user][:password]
        @password_confirmation = params[:user][:password_confirmation]
        if  @email == "" or @password == "" or @password_confirmation == ""
            redirect_to users_new_path, :notice => "Fill in the Email, Password, and Password Confirmation!"
            
        
        elsif @user.save
            redirect_to auth_index_path, :notice => "Signed up!"
        
        end
    end
  
    def show
        @user ||= User.find(session[:user_id]) if session[:user_id]
        rescue ActiveRecord::RecordNotFound
    end
    
    def update
    end
    
    def destroy
    end
    
    helper_method :current_user
    
    #skip_before_filter :require_login
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        rescue ActiveRecord::RecordNotFound
    end
    
    #before_filter :require_user
    
    #def require_user
        #redirect_to users_path unless current_user
    #end
end
