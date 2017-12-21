require 'rails_helper'

RSpec.feature "User account features" do
	scenario "Create a new User account" do
		visit "/"
		click_link "Register"

		fill_in "Name", with: "Testname"
		fill_in "Email", with: "test@email.com"
		fill_in "Password", with: "123456"
		fill_in "Password confirmation", with: "123456"

		click_button "Sign up"

		expect(page).to have_content("Welcome! You have signed up successfully.")
		expect(page.current_path).to eq(root_path)
	end

	scenario "Fail creating a new User account" do
		visit "/"
		click_link "Register"

		fill_in "Name", with: ""
		fill_in "Email", with: ""
		fill_in "Password", with: ""
		fill_in "Password confirmation", with: ""

		click_button "Sign up"

		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Email can't be blank")
		expect(page).to have_content("Password can't be blank")
		expect(page).to have_content("Password (6 characters minimum)")
	end

	scenario "Logging into and out of an account" do
		User.create(name: "Testname", email: "test@email.com", password: "123456")

		visit "/"
		click_link "Login"

		fill_in "Email", with: "test@email.com"
		fill_in "Password", with: "123456"

		click_button "Log in"

		expect(page).to have_content("Signed in successfully.")
		expect(page.current_path).to eq(root_path)

		click_link "Logout"

		expect(page).to have_content("Signed out successfully.")
	end

	scenario "Fail logging into an account" do
		visit "/"
		click_link "Login"

		fill_in "Email", with: "y@x.com"
		fill_in "Password", with: "654321"

		click_button "Log in"

		expect(page).to have_content("Invalid Email or password.")
	end

	scenario "Deleting an account" do
		User.create(name: "Testname", email: "test@email.com", password: "123456")

		visit "/"
		click_link "Login"

		fill_in "Email", with: "test@email.com"
		fill_in "Password", with: "123456"

		click_button "Log in"

		click_link "Delete Account"
		expect(page).to have_content(
																"Bye! Your account has been successfully cancelled. 
																We hope to see you again soon."
																)
	end

end