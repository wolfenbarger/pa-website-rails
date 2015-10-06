require 'rails_helper'

describe CallbacksController do
	context 'google auth' do
		before do 
			request.env["devise.mapping"] = Devise.mappings[:user]
			request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
		end
		it 'should authenticate and identify user if user is known' do 
			get :google_oauth2
			expect(response).to redirect_to '/' 
		end 
	end
	context 'facebook auth' do
		before do 
			request.env["devise.mapping"] = Devise.mappings[:user]
			request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
		end
		it 'should authenticate and identify user if user is known' do 
			get :facebook 
			expect(response).to redirect_to '/' 
		end 
	end

end