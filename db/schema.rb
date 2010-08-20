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

ActiveRecord::Schema.define(:version => 20100802231401) do

  create_table "calenders", :force => true do |t|
    t.string   "title"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_events", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "category_id"
  end

  create_table "events", :force => true do |t|
    t.text     "reservation_top_html"
    t.text     "reservation_bottom_html"
    t.text     "payment_top_html"
    t.text     "payment_bottom_html"
    t.string   "image_file_name"
    t.string   "title"
    t.boolean  "title_show",              :default => true
    t.string   "type_title"
    t.boolean  "type_title_show",         :default => true
    t.string   "note_title",              :default => "Note: "
    t.boolean  "note_title_show"
    t.integer  "category_ids"
    t.boolean  "category_ids_show",       :default => true
    t.string   "date_title",              :default => "Date: "
    t.boolean  "date_title_show",         :default => true
    t.string   "time_title",              :default => "Time: "
    t.boolean  "time_title_show",         :default => true
    t.string   "address_title",           :default => "Address: "
    t.boolean  "address_title_show",      :default => true
    t.string   "city_title",              :default => "City: "
    t.boolean  "city_title_show",         :default => true
    t.string   "zipcode_title",           :default => "Zipcode: "
    t.boolean  "zipcode_title_show",      :default => true
    t.string   "first_name_title",        :default => "First Name: "
    t.boolean  "first_name_title_show",   :default => true
    t.string   "last_name_title",         :default => "Last Name: "
    t.boolean  "last_name_title_show",    :default => true
    t.string   "email_title",             :default => "Email: "
    t.boolean  "email_title_show",        :default => true
    t.string   "phone_title",             :default => "Phone: "
    t.boolean  "phone_title_show",        :default => true
    t.string   "field1_title",            :default => "Field 1: "
    t.boolean  "field1_title_show",       :default => true
    t.string   "field2_title",            :default => "Field 2: "
    t.boolean  "field2_title_show",       :default => true
    t.string   "field3_title",            :default => "Field 3: "
    t.boolean  "field3_title_show",       :default => true
    t.boolean  "radio1_title_show",       :default => true
    t.string   "radio11_title",           :default => "Radio 1.1: "
    t.string   "radio12_title",           :default => "Radio 1.2: "
    t.string   "radio13_title",           :default => "Radio 1.3: "
    t.boolean  "radio2_title_show",       :default => true
    t.string   "radio21_title",           :default => "Radio 2.1: "
    t.string   "radio22_title",           :default => "Radio 2.2: "
    t.string   "radio23_title",           :default => "Radio 2.3: "
    t.integer  "price"
    t.boolean  "visible"
    t.boolean  "purchaseable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "event_id"
    t.string   "type_of"
    t.string   "date"
    t.string   "date_round"
    t.string   "time"
    t.string   "time_round"
    t.string   "address"
    t.string   "address_round"
    t.string   "city"
    t.string   "city_round"
    t.string   "zipcode"
    t.string   "zipcode_round"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.string   "radio1"
    t.string   "radio2"
    t.string   "published",     :default => "true"
    t.date     "published_on",  :default => '2010-08-19'
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.string   "date"
    t.integer  "passengers"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
