class Diary < ActiveRecord::Base
  has_many :comments
	belongs_to :user
  belongs_to :team
	validates_presence_of :body
	validates_presence_of :user_id
	validates_presence_of :team_id
end
