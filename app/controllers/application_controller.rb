class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :current_user
  
    private
  
    def current_user
      # p "Finding user with #{session[:user_id]}"
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      
      # p "Found user with #{current_user}"
    end
  end



