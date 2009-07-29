class AddStatusToTeamsUser < ActiveRecord::Migration
  def self.up
    add_column :teams_users, :status, :integer
  end

  def self.down
    remove_column :teams_users, :status
  end
end
