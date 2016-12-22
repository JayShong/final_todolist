require 'rails_helper'

RSpec.describe "sign up", :type => :request do 
	it "informs the user upon successful sign up" do

		visit "/user/new"
		fill_in "user[name]", :with => "test"
		fill_in "user[email]", :with => "testing2@gmail.com"
		fill_in "user[password]", :with => "secret"
		click_button "Register"

		expect(page).to have_selector("div", :text => "Your account has been created.")
	end
end