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

ActiveRecord::Schema.define(:version => 20090610080716) do

  create_table "tweets", :force => true do |t|
    t.string   "from_user"
    t.string   "text"
    t.string   "profile_image_url"
    t.string   "iso_language_code"
    t.string   "tweet_id"
    t.string   "user_id"
    t.string   "tweeted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wants", :force => true do |t|
    t.string   "user"
    t.string   "text"
    t.string   "text_original"
    t.string   "image_url"
    t.string   "lang"
    t.string   "twitt_id"
    t.string   "user_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
