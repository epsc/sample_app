class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation
	before_save { email.downcase! }
	
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
								uniqueness: { case_sensitive: false }
	
	validates :password, length: { minimum: 6 }
	has_secure_password
	after_validation { self.errors.messages.delete(:password_digest) }
end
