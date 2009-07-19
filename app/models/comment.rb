class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :diaries	
	validates_presence_of :body
	validates_presence_of :user_id
	validates_presence_of :diary_id
end
