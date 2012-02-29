class SessionController < ApplicationController

	def create
		redirect_to "/auth/facebook"
	end

	def destroy
		self.current_user = nil
		redirect_to root_url
	end

	def failure
	end

end
