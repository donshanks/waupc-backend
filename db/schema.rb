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

ActiveRecord::Schema.define(:version => 20100123085200) do

  create_table "bookings", :force => true do |t|
    t.integer  "deputation_id",               :default => 0,      :null => false
    t.integer  "church_id"
    t.string   "status",        :limit => 20, :default => "open", :null => false
    t.date     "date_of"
    t.time     "time_of"
    t.string   "meridian",      :limit => 2,  :default => "pm",   :null => false
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "churches", :force => true do |t|
    t.string   "status",           :limit => 20,                                :default => "active", :null => false
    t.string   "pastor"
    t.integer  "minister_id",                                                                         :null => false
    t.string   "church_name"
    t.integer  "section",          :limit => 2,                                 :default => 0,        :null => false
    t.string   "outreach_cities"
    t.integer  "dist_zip",                                                      :default => 0,        :null => false
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
    t.integer  "owner"
    t.string   "languages"
    t.text     "search_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "churches", ["search_text"], :name => "search_text"

  create_table "deputations", :force => true do |t|
    t.integer  "missionary_id",                   :default => 0,        :null => false
    t.string   "status",           :limit => 20,  :default => "active", :null => false
    t.date     "date_start"
    t.date     "date_end"
    t.string   "method_of_travel", :limit => 128
    t.string   "accomodations",    :limit => 128
    t.integer  "number_in_party",                 :default => 1,        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "filename",   :limit => 100, :null => false
    t.string   "mime_type",  :limit => 200, :null => false
    t.string   "caption",                   :null => false
    t.text     "abstract",                  :null => false
    t.datetime "created_at",                :null => false
  end

  add_index "documents", ["filename"], :name => "filename", :unique => true

  create_table "events", :force => true do |t|
    t.string   "key",           :limit => 50,  :null => false
    t.string   "name",          :limit => 100, :null => false
    t.string   "location",      :limit => 100
    t.string   "tagline",       :limit => 100
    t.string   "dateline",      :limit => 100
    t.datetime "reg_expires"
    t.text     "desc"
    t.string   "poster_link",   :limit => 200
    t.string   "hotel_link",    :limit => 200
    t.string   "map_link",      :limit => 200
    t.string   "brochure_link", :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["key"], :name => "index_events_on_key"

  create_table "minister_bios", :force => true do |t|
    t.text     "content",       :limit => 2147483647, :null => false
    t.text     "address",       :limit => 16777215
    t.string   "display_name"
    t.string   "photo_link"
    t.string   "photo_caption"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "minister_bios", ["content"], :name => "bio_text"
  add_index "minister_bios", ["display_name"], :name => "display_name"

  create_table "minister_roles", :force => true do |t|
    t.string   "bio_id",     :limit => 25, :null => false
    t.string   "name",                     :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "ministers", :force => true do |t|
    t.string   "bio_id",        :limit => 25
    t.string   "status",        :limit => 0,   :default => "active", :null => false
    t.string   "lastname"
    t.string   "firstname"
    t.string   "address"
    t.string   "city"
    t.string   "state",         :limit => 2
    t.string   "zip",           :limit => 50
    t.string   "address2_type", :limit => 100
    t.string   "address2"
    t.string   "city2"
    t.string   "state2",        :limit => 2
    t.string   "zip2",          :limit => 50
    t.string   "title"
    t.string   "phone_home"
    t.string   "phone_mobile"
    t.string   "phone_fax"
    t.string   "email"
    t.string   "notes"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "ministers", ["bio_id"], :name => "bio_id"
  add_index "ministers", ["city"], :name => "idx_ministers_city"
  add_index "ministers", ["email"], :name => "uq_ministers_email"
  add_index "ministers", ["lastname"], :name => "idx_ministers_lastname"
  add_index "ministers", ["status"], :name => "idx_ministers_status"

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

  create_table "registrations", :force => true do |t|
    t.string   "txn_id",       :limit => 17
    t.string   "event",        :limit => 50,                        :null => false
    t.string   "invoice",      :limit => 50,                        :null => false
    t.string   "name",         :limit => 100,                       :null => false
    t.string   "address",      :limit => 200
    t.string   "city",         :limit => 100
    t.string   "state",        :limit => 2
    t.string   "postal",       :limit => 10
    t.string   "phone",        :limit => 30
    t.string   "email",        :limit => 200
    t.string   "church",       :limit => 100
    t.string   "pastor",       :limit => 200
    t.string   "method",       :limit => 25,  :default => "online", :null => false
    t.boolean  "paid",                        :default => false,    :null => false
    t.datetime "paid_date"
    t.float    "paid_amt",                    :default => 0.0,      :null => false
    t.float    "paid_fee",                    :default => 0.0,      :null => false
    t.text     "reference"
    t.boolean  "valid_record",                :default => true,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["event"], :name => "index_registrations_on_event"
  add_index "registrations", ["paid"], :name => "paid"
  add_index "registrations", ["valid_record"], :name => "valid"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",            :null => false
    t.string   "crypted_password", :null => false
    t.string   "password_salt",    :null => false
    t.integer  "login_count"
    t.datetime "last_request"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

end
