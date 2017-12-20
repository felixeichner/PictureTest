require 'rails_helper'

RSpec.feature "Creating a User" do
	scenario "Create a new User account" do
		visit "/register"

		fill_in "name", with: "Testname"
		fill_in "email", with: "test@email.com"
		
	end
end