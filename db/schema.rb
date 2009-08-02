# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090802150714) do

  create_table "attachments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "user_id",    :null => false
    t.integer  "diary_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diaries", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "user_id",    :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "teams", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alias"
  end

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer  "team_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",         :null => false
    t.string   "password_hash", :null => false
    t.string   "alias",         :null => false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
