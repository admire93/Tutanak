class AddLeaderIdToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :leader_id, :integer
  end

  def self.down
    remove_column :teams, :leader_id
  end
end
