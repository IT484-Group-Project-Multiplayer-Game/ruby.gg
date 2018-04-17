class UsersController < ApplicationController
    def index
    end
    def new
    end

    def create
    end


    def edit
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