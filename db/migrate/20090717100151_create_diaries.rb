class CreateDiaries < ActiveRecord::Migration
  def self.up
    create_table :diaries do |t|
      t.integer :user_id, :null => false;
      t.integer :team_id, :null => false;
      t.text :body, :null => false;	
			t.timestamp :created_at, :null => false
    end
  end

  def self.down
    drop_table :diaries
  end
end
