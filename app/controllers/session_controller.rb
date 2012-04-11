class SessionController < ApplicationController

	def intermediate
	end

	def create
		redirect_to "/auth/facebook"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

	def failure
	end

end
