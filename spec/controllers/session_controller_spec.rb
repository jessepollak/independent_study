require 'spec_helper'



describe SessionController do

	before do
		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
		@id = OmniAuth.config.mock_auth[:facebook][:uid]
	end

	describe "create" do
		it "should redirect to facebook API" do
			get :create
			response.should redirect_to("/auth/facebook")
		end
	end

	describe "destroy" do
		it "should erase the session" do
			get :destroy
			assigns(:current_user).should be_nil
		end
	end
end
