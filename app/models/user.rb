require 'sha1'

class User < ActiveRecord::Base
	has_and_belongs_to_many :teams
	has_many :diaries
	has_many :comments
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
