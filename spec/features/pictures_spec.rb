require 'rails_helper'

RSpec.feature "Dealing with pictures" do
	scenario "Upload an image" do
		User.create(name: "Testname", email: "test@email.com", password: "123456")

		visit "/"
		click_link "Login"

		fill_in "Email", with: "test@email.com"
		fill_in "Password", with: "123456"

		click_button "Log in"

		
	end
end