require 'rails_helper'

RSpec.feature "Dealing with images" do
	before do
		@user = User.create(name: "Testname", email: "test@email.com", password: "123456")
	end

	scenario "Upload an image" do
		visit "/"
		click_link "Login"

		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password

		click_button "Log in"

		click_link "Upload new Image"

		attach_file('image[image]', Rails.root + "spec/bottles_bw.jpg")

		click_button "Create"

		expect(page).to have_content("Image was successfully created.")
		expect(page).to have_http_status(:success)
	end

	scenario "Uploading fails" do
		visit "/"
		click_link "Login"

		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password

		click_button "Log in"

		click_link "Upload new Image"

		click_button "Create"

		expect(page).to have_content("Image can't be blank")
	end

	scenario "Deleting Image" do
		visit "/"
		click_link "Login"

		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password

		click_button "Log in"

		click_link "Upload new Image"

		attach_file('image[image]', Rails.root + "spec/bottles_bw.jpg")

		click_button "Create"

		visit "/"

		click_link "Delete Image"

		expect(page).to have_content("Image was successfully destroyed.")
	end

	scenario "Handling Images without being signed in fails" do
		visit "/images/new"
		expect(current_path).to eq(images_path)
	end
end