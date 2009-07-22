class Team < ActiveRecord::Base
	belongs_to :leader, :class_name => 'User'
	has_many :diaries
  validates_presence_of :title
	validates_presence_of :alias
	validates_uniqueness_of :alias
	
end
