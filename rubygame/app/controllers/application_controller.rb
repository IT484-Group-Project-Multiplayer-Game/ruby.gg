require 'ruby_gg'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  @@client = RubyGg::Client.new(ENV['league_api_key'], 'na')
  
end
