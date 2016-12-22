class User < ActiveRecord::Base
	has_secure_password

	validates :email, format: { with: /@/, message: "Emails must have @."}
	validates_uniqueness_of :email, message: "This email has been registered. Please use another email."
	
	has_many :lists
	has_many :authentications, :dependent => :destroy

	mount_uploader :avatar, AvatarUploader

	def self.create_with_auth_and_hash(authentication,auth_hash)
    	create! do |u|
    		u.password = Time.now.to_s
    	  u.name = auth_hash["info"]["first_name"]
    	  u.email = auth_hash["extra"]["raw_info"]["email"]
    	  u.authentications<<(authentication)
    	end
  	end

 	def fb_token
  		x = self.authentications.where(:provider => :facebook).first
  	  	return x.token unless x.nil?
  	end

  	def password_optional?
 	    true
 	 end
end
