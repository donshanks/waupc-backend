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

ActiveRecord::Schema.define(:version => 20081116032712) do

  create_table "bookings", :force => true do |t|
    t.integer  "deputation_id", :limit => 11, :default => 0,      :null => false
    t.integer  "church_id",     :limit => 11
    t.string   "status",        :limit => 20, :default => "open", :null => false
    t.date     "date_of"
    t.time     "time_of"
    t.string   "meridian",      :limit => 2,  :default => "pm",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "churches", :force => true do |t|
    t.string   "status",           :limit => 20,                                :default => "active", :null => false
    t.string   "pastor"
    t.string   "church_name"
    t.integer  "section",          :limit => 1,                                 :default => 0,        :null => false
    t.string   "outreach_cities"
    t.integer  "dist_zip",         :limit => 11,                                :default => 0,        :null => false
    t.decimal  "lat",                            :precision => 10, :scale => 6
    t.decimal  "lon",                            :precision => 10, :scale => 6
    t.string   "physical_address"
    t.string   "physical_city"
    t.string   "physical_zip"
    t.string   "mailing_address"
    t.string   "mailing_city"
    t.string   "mailing_zip"
    t.string   "phone"
    t.string   "phone2"
    t.string   "fax"
    t.string   "email"
    t.boolean  "show_email",                                                    :default => false,    :null => false
    t.string   "web"
    t.integer  "owner",            :limit => 11
    t.string   "languages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deputations", :force => true do |t|
    t.integer  "missionary_id",    :limit => 11,  :default => 0,        :null => false
    t.string   "status",           :limit => 20,  :default => "active", :null => false
    t.date     "date_start"
    t.date     "date_end"
    t.string   "method_of_travel", :limit => 128
    t.string   "accomodations",    :limit => 128
    t.integer  "number_in_party",  :limit => 5,   :default => 1,        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missionaries", :force => true do |t|
    t.string   "firstname",  :limit => 128, :null => false
    t.string   "lastname",   :limit => 64,  :null => false
    t.string   "labor",      :limit => 128, :null => false
    t.string   "phone",      :limit => 64
    t.string   "email"
    t.string   "poster"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "missionaries", ["lastname"], :name => "lastname"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",                          :null => false
    t.string   "crypted_password",               :null => false
    t.string   "password_salt",                  :null => false
    t.string   "remember_token",                 :null => false
    t.integer  "login_count",      :limit => 11
    t.datetime "last_request"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

end
