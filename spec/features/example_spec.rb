require 'rails_helper.rb'

feature "Going to website", js: true do
  scenario "opening index page" do
    visit '/'
    #fill_in "keywords", with: "baked"
    #click_on "Search"
	expect(page).to have_content("Home View")
    #expect(page).to have_content("Baked Potato")
    #expect(page).to have_content("Baked Brussel Sprouts")
  end
end