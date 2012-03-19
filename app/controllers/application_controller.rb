class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  protected
  	helper_method :current_user, :signed_in?

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

  	def current_user=(user)
  		@current_user = user
      session[:user_id] = @current_user.id
  	end

  	def signed_in?
  		return @current_user != nil
  	end
  	
end
