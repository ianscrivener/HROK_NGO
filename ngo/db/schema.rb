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

ActiveRecord::Schema.define(:version => 20130601095911) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "skype"
    t.string   "linkedin"
    t.string   "in_main"
    t.integer  "organisation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "geo_vn_admin1", :id => false, :force => true do |t|
    t.integer "ID_0"
    t.integer "ID_1"
    t.string  "ISO3_0"
    t.string  "NAME_0"
    t.string  "NAME_1"
    t.string  "VARNAME_1"
    t.string  "ENGTYPE_1"
  end

  create_table "geo_vn_admin2", :id => false, :force => true do |t|
    t.integer "ID_0"
    t.integer "ID_1"
    t.integer "ID_2"
    t.string  "ISO3_0"
    t.string  "NAME_0"
    t.string  "NAME_1"
    t.string  "NAME_2"
    t.string  "VARNAME_2"
    t.string  "ENGTYPE"
  end

  create_table "geo_vn_admin3", :id => false, :force => true do |t|
    t.float  "ID_0"
    t.float  "ID_1"
    t.float  "ID_2"
    t.float  "ID_3"
    t.string "ISO_3"
    t.string "NAME_0"
    t.string "NAME_1"
    t.string "NAME_2"
    t.string "NAME_3"
    t.string "VARNAME_3"
    t.string "ENGTYPE"
  end

  create_table "locations", :force => true do |t|
    t.string   "address_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "state"
    t.string   "suburb"
    t.string   "country"
    t.string   "country_code"
    t.string   "postcode"
    t.string   "is_main"
    t.string   "geo_admin_0"
    t.string   "geo_admin_1"
    t.string   "geo_admin_2"
    t.string   "geo_admin_3"
    t.string   "geo_admin_4"
    t.string   "geo_dlat"
    t.string   "geo_dlong"
    t.string   "geo_geocode_modified"
    t.string   "geo_geocode_reqd"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "organisation_id"
  end

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

  create_table "uris", :force => true do |t|
    t.string   "type"
    t.string   "url"
    t.string   "type_other"
    t.integer  "organisation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
