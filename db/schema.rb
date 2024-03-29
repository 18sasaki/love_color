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

ActiveRecord::Schema.define(:version => 20130317055342) do

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.string   "view_name"
    t.string   "rgb"
    t.integer  "sort"
    t.integer  "deleted",    :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "configurations", :force => true do |t|
    t.string   "key"
    t.string   "value1"
    t.string   "value2"
    t.integer  "deleted",    :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "view_name"
    t.integer  "sort"
    t.integer  "deleted",    :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "view_name"
    t.integer  "group_id"
    t.integer  "color_id"
    t.integer  "push_flg",       :default => 0
    t.integer  "center_flg",     :default => 0
    t.integer  "graduation_flg", :default => 0
    t.integer  "deleted",        :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "wiki"
    t.string   "twitter"
    t.string   "blog_url"
    t.string   "blog_name"
  end

end
