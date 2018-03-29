class UsersController < ApplicationController
    def index
    end

    def create
    end

    def new
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end
    
    helper_method :current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
