class User < ActiveRecord::Base
	has_and_belongs_to_many :teams
	has_many :diaries
	has_many :comments
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :password
	validates_presence_of :alias
	validates_uniqueness_of :alias

	def password

	end
end
