module RequestsHelper

	def owner?(request)
		if signed_in?
			@current_user.requests.member? request
		end
	end

end
