class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  	helper_method :current_user, :signed_in?

  	def current_user=(user)
  		@current_user = user
  	end

  	def signed_in?
  		return @current_user != nil
  	end
  	
end
