require 'rails_helper'

RSpec.feature "Creating a User" do
	scenario "Create a new User account" do
		visit "/"
		click_link "Register"

		# fill_in "Name", with: "Testname"
		fill_in "Email", with: "test@email.com"
		fill_in "Password", with: "123456"
		fill_in "Password confirmation", with: "123456"

		click_button "Sign up"

		expect(page).to have_content("Welcome! You have signed up successfully.")
		expect(page.current_path).to eq(root_path)
	end
end