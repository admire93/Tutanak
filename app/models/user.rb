require 'sha1'

class User < ActiveRecord::Base
	has_many :diaries
	has_many :comments
	has_many :teams, :foreign_key => :leader_id
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :password
	validates_presence_of :alias
	validates_uniqueness_of :alias

	def initialize(data = {})
	  if data[:password].to_s.empty?
			data[:password_hash] = ''
		else
			data[:password_hash] = PasswordHash.hash(data[:email],data[:password]) 
			data.delete :password
		end
		super(data)
	end
	
	def password
		return if password_hash.to_s.empty?
		PasswordHash.new(email, password_hash)
	end
  def self.find_user_by_email(email)
		User.find(:all, :conditions => {:email => email})[0]
	end
	def self.is_can_login?(email,password)
		user = User.find_user_by_email(email)
		password_hash = user.password_hash
		input_password_hash = PasswordHash.hash(email,password)
		if password_hash == input_password_hash
			true
		else
			false
		end
	end
	def self.find_id_by_email(email)
		user = User.find_user_by_email(email)
		user.id
	end
end

class PasswordHash	
	def self.hash(email, password)
		SHA1.new(SHA1.new(password.reverse).to_s + "\n" + email).to_s.reverse
	end

	def initialize(email, password_hash)
		@email = email
		@password_hash = password_hash
	end
	
	def ==(password)
		@password_hsh = PasswordHash.hash(@email, password)
	end
end
