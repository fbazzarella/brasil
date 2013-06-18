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

ActiveRecord::Schema.define(:version => 20130618233027) do

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "photo_url"
    t.string   "access_token"
    t.text     "extra"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "ip"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.string   "country_code"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "timezone"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end