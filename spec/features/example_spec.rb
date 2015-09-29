require 'rails_helper.rb'

include Warden::Test::Helpers
Warden.test_mode!

# sleep(inspection_time=3)



feature "Logging Out", js: true, :sauce => true do
  before(:each) do
    @user = FactoryGirl.create(:user, name:"Test Name")
    login_as @user, :scope => :user
  end
  scenario "Logging Out" do
    visit '/'
    click_link('Test Name')
    click_link('Sign Out')
    expect(page).to have_content 'Sign In'
  end
end
feature "Login Modal", js: true, :sauce => true do
  scenario "Unathenticated user clicks 'Sign In' and then clicks back" do
    visit '/'
    click_link('Sign In')
    expect(page).to have_link('Login with Facebook')
    expect(page).to have_link('Login with Google')
    click_button('back')
    expect(page).to have_no_link('Login with Facebook')
  end
end