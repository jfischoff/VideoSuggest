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

ActiveRecord::Schema.define(:version => 20101108020901) do

  create_table "expected_probs", :force => true do |t|
    t.float    "prob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "video_id"
  end

  add_index "expected_probs", ["user_id"], :name => "index_expected_probs_on_user_id"
  add_index "expected_probs", ["video_id"], :name => "index_expected_probs_on_video_id"

  create_table "ratings", :force => true do |t|
    t.string   "likiness"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "video_id"
  end

  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"
  add_index "ratings", ["video_id"], :name => "index_ratings_on_video_id"

  create_table "suggested_videos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "expected_prob_id"
  end

  add_index "suggested_videos", ["expected_prob_id"], :name => "index_suggested_videos_on_expected_prob_id"
  add_index "suggested_videos", ["user_id"], :name => "index_suggested_videos_on_user_id"

  create_table "unwatched_videos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

  create_table "videos", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewings", :force => true do |t|
    t.datetime "view_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "rating_id"
    t.integer  "video_id"
    t.string   "rating"
  end

  add_index "viewings", ["rating_id"], :name => "index_viewings_on_rating_id"
  add_index "viewings", ["user_id"], :name => "index_viewings_on_user_id"
  add_index "viewings", ["video_id"], :name => "index_viewings_on_video_id"

end
