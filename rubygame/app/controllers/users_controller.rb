class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end

    def create
     params.permit!
    # @user = User.new(params[:user])
     @user = User.new(user_params)
        if @user.save
        redirect_to root_url, :notice => "user created successfully!"
        else
           render "new"
            
        end
    end
    
    
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
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
