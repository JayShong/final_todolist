class User < ActiveRecord::Base
	has_secure_password

	validates :email, format: { with: /@/, message: "Emails must have @."}
	validates_uniqueness_of :email, message: "This email has been registered. Please use another email."
	
	has_many :lists

	mount_uploader :avatar, AvatarUploader
end
