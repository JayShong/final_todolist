class List < ActiveRecord::Base

	has_many :tasks
	belongs_to :user

	validates_uniqueness_of :user_id, message: "Each person can only have one list."
	
end
