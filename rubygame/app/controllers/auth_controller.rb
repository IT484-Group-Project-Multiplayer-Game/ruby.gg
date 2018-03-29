class AuthController < ApplicationController
  #def index
  #end

  #def create
  #end
  
  #below this line is added
  skip_before_action:authorize
    
    def new
    end
    def create
        user=User.find_by(name:params[:user_email])
    if user and user.authenticate(params[:user_password])
        sessions[:user_id]=user.id
        redirect_to auth_url
    else
        redirect_to login_url, alert:"invaldi username or"
        
    end
    end
    def destroy
        sessions[:user_id]=nil
        redirect_to login_url, alert:"success"
    end
end
