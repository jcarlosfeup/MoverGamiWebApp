class User < ActiveRecord::Base
	require 'digest'
	attr_accessor :password
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	attr_accessible :username, :email, :password, :password_confirmation,:isAdmin
	has_one :stat
	has_many :badges 
	has_many :facts 
	has_many :rewards
	has_many :challenges

	validates :username, presence: true, :uniqueness => true, :length => { :in => 4..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create

	before_save :encrypt_password
	after_save :clear_password

	#encrypts password using MD5
	def encrypt_password
	  
	  if password.present?
	    #self.salt = BCrypt::Engine.generate_salt
	    md5 = Digest::MD5.new
		md5.update password
		
	    #self.encrypted_password= BCrypt::Engine.hash_secret(password,salt)
	    self.encrypted_password = md5.hexdigest 
	  end
	end

	def clear_password
	  self.password = nil
	end

	def self.authenticate(username_or_email="", login_password="")
		if  EMAIL_REGEX.match(username_or_email)    
			user = User.find_by_email(username_or_email)
		else
			user = User.find_by_username(username_or_email)
		end
		
		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end   
	
	#checks if password is equal
	def match_password(login_password="")
		md5 = Digest::MD5.new
		md5.update login_password
		encrypted_password == md5.hexdigest
	end
end