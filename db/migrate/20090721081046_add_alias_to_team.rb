class AddAliasToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :alias, :string, :null => false
  end

  def self.down
    remove_column :teams, :alias
  end
end
