# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110425031734) do

  create_table "groups", :force => true do |t|
    t.integer  "tournament_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["tournament_id"], :name => "index_groups_on_tournament_id"

  create_table "teams", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "admin"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["user_id", "group_id"], :name => "index_teams_on_user_id_and_group_id", :unique => true

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.string   "league"
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["name", "league"], :name => "index_tournaments_on_name_and_league", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "username"
    t.string   "profile"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
