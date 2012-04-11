require 'uri'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  protected
  	helper_method :current_user, :signed_in?, :user_check, :good_redirect

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
  	
    def user_check
      unless @current_user
        redirect_to root_url 
      end
    end

    def good_redirect(r)
      r = URI.parse(r).path if r
      if r == "/session/intermediate"
        redirect_to controller: "requests", action: "new"
      elsif !r.nil?
        redirect_to :back
      else
        redirect_to root_url
      end
    end
end
