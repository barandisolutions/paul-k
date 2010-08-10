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
    t.string   "title"
    t.boolean  "title_show"
    t.string   "type_title"
    t.boolean  "type_title_show"
    t.string   "note_title",            :default => "Note: "
    t.boolean  "note_title_show"
    t.integer  "category_ids"
    t.boolean  "category_ids_show"
    t.string   "date_title",            :default => "Date: "
    t.boolean  "date_title_show"
    t.string   "time_title",            :default => "Time: "
    t.boolean  "time_title_show"
    t.string   "address_title",         :default => "Address: "
    t.boolean  "address_title_show"
    t.string   "city_title",            :default => "City: "
    t.boolean  "city_title_show"
    t.string   "zipcode_title",         :default => "Zipcode: "
    t.boolean  "zipcode_title_show"
    t.string   "first_name_title",      :default => "First Name: "
    t.boolean  "first_name_title_show"
    t.string   "last_name_title",       :default => "Last Name: "
    t.boolean  "last_name_title_show"
    t.string   "email_title",           :default => "Email: "
    t.boolean  "email_title_show"
    t.string   "phone_title",           :default => "Phone: "
    t.boolean  "phone_title_show"
    t.integer  "price"
    t.boolean  "purchaseable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "category_id"
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
    t.integer  "phone"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.string   "date"
    t.integer  "passengers"
    t.string   "published_on"
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
