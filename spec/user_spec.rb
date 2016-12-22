require "rails_helper"

RSpec.describe User, :type => :model do
	it "does not accept duplicate emails" do
		user = User.create(email: "testing1@gmail.com", password: "hohoho")
		user2 = User.create(email: "testing1@gmail.com", password: "hohoho")
		expect(user2.save).to eq false
	end

	it "creates a user" do
		user = User.create(email: "testing1@gmail.com", password: "hohoho")
		expect(user.save).to eq true
	end

	it "updates a user's name" do
		user = User.create(email: "testing1@gmail.com", password: "hohoho")
		user.update(name: "test")
		expect(user.save).to eq true
	end
end