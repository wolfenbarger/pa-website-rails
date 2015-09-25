require 'rails_helper.rb'

feature "Looking up recipes", js: true do
  scenario "finding recipes" do
    visit '/'
    click_on "login-button"
    click_on "facebook-login"
    #fill_in "keywords", with: "baked"
    #click_on "Search"
	expect(page).to have_content("Home View")
    #expect(page).to have_content("Baked Potato")
    #expect(page).to have_content("Baked Brussel Sprouts")
  end
end