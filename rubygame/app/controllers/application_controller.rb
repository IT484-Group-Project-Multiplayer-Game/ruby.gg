require 'rito_api'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  include SessionsHelper
  
  @@client = RitoApi::Client.new("RGAPI-89538f52-2141-443c-aaaa-9cb0d44ea380", 'na', true, 180)

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  private
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
