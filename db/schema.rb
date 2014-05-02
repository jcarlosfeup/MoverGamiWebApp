# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140502105807) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "restriction_id"
  end

  add_index "badges", ["restriction_id"], :name => "index_badges_on_restriction_id"

  create_table "challenges", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "trigger_id"
    t.integer  "goal_id"
  end

  create_table "facts", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "restriction_id"
  end

  add_index "facts", ["restriction_id"], :name => "index_facts_on_restriction_id"

  create_table "features", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restrictions", :force => true do |t|
    t.decimal  "threshold"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "feature_id"
    t.integer  "timeframe_id"
    t.integer  "activity_id"
  end

  add_index "restrictions", ["activity_id"], :name => "index_restrictions_on_activity_id"
  add_index "restrictions", ["feature_id"], :name => "index_restrictions_on_feature_id"
  add_index "restrictions", ["timeframe_id"], :name => "index_restrictions_on_timeframe_id"

  create_table "rewards", :force => true do |t|
    t.text     "url"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "timeframes", :force => true do |t|
    t.string   "type_limit"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "isAdmin"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
