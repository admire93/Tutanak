class CreateDiaries < ActiveRecord::Migration
  def self.up
    create_table :diaries do |t|
      t.text :body
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :diaries
  end
end
