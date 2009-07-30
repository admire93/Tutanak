class Team < ActiveRecord::Base
  has_and_belongs_to_many :user
	has_many :diaries
  validates_presence_of :title
	validates_presence_of :alias
	validates_uniqueness_of :alias
	def self.is_user_join?(user_id,team_id)
    users = Team.find(team_id).user
    for user in users
      if user.id == user_id
        is_join =  true
			  break
      end
    end
    is_join = false if is_join.nil?
    is_join
  end
end
