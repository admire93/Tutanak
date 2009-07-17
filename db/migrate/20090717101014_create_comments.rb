class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body, :null => false
      t.integer :user_id, :null => false
      t.integer :dairy_id, :null => false
			t.timestamp :created_at, :null => false
    end
  end

  def self.down
    drop_table :comments
  end
end
