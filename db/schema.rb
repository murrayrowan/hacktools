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

ActiveRecord::Schema.define(:version => 20130211183638) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.time     "time"
    t.string   "logo"
    t.string   "owner"
    t.string   "venue"
    t.string   "street_address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "email"
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.string   "url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "country"
    t.integer  "event_id"
  end

  create_table "events_hackers", :id => false, :force => true do |t|
    t.integer  "event_id"
    t.integer  "hacker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events_hackers_teams", :id => false, :force => true do |t|
    t.integer  "event_id"
    t.integer  "hacker_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hackers", :force => true do |t|
    t.string   "uname"
    t.string   "fname"
    t.string   "lname"
    t.string   "city"
    t.string   "country"
    t.string   "company"
    t.string   "jobtitle"
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.date     "dob"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "team_id"
  end

  create_table "hackers_hacks", :id => false, :force => true do |t|
    t.integer  "hack_id"
    t.integer  "hacker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hacks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "logo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "team_id"
    t.integer  "event_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "logo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "event_id"
  end

end
