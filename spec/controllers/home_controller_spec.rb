require 'rails_helper'

describe HomeController do

	describe "GET #index" do

		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		context "user is authenticated" do
		    before(:each) do
				@request.env["devise.mapping"] = Devise.mappings[:user]
				user = FactoryGirl.create(:user, name:"Test Name", id:"123456")
				sign_in user
		    end
			it "should set user cookie values" do
				get :index
				expect(response.cookies['user_id']).to eq("123456")
				expect(response['set-cookie']).to eq("user_name=Test Name")
			end
		end

		context "user is unauthenticated" do
			it "should not set the user cookie values" do
				get :index
				expect(response.cookies['user_id']).to eq(nil)
				expect(response['set-cookie']).to eq(nil)
			end
		end

	end

end














