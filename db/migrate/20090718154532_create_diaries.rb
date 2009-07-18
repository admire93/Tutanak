class CreateDiaries < ActiveRecord::Migration
  def self.up
    create_table :diaries do |t|
      t.text :body, :null => false
      t.integer :user_id, :null => false
      t.integer :team_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :diaries
  end
end
