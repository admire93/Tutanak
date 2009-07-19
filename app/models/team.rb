class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
	has_many :diaries
  validates_presence_of :title
	validates_uniqueness_of :title
end
