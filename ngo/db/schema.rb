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

ActiveRecord::Schema.define(:version => 20130601055739) do

  create_table "organisations", :force => true do |t|
    t.string   "name_display"
    t.string   "name_short"
    t.string   "name_full"
    t.string   "main_email"
    t.string   "main_phone"
    t.string   "main_fax"
    t.string   "main_url"
    t.string   "ngo_short_description", :limit => 125
    t.string   "ngo_long_description",  :limit => 1000
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
