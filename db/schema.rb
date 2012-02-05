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

ActiveRecord::Schema.define(:version => 20120108085614) do

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "photo"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "asset"
    t.integer  "file_size"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "posts_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["code"], :name => "index_categories_on_code"
  add_index "categories", ["name"], :name => "index_categories_on_name"
  add_index "categories", ["posts_count"], :name => "index_categories_on_posts_count"

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.datetime "checkin_at"
    t.datetime "checkout_at"
    t.text     "description"
    t.text     "feedback"
    t.string   "type_identifier"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["checkin_at"], :name => "index_events_on_checkin_at"
  add_index "events", ["checkout_at"], :name => "index_events_on_checkout_at"
  add_index "events", ["state"], :name => "index_events_on_state"
  add_index "events", ["type_identifier"], :name => "index_events_on_type_identifier"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "name_zh"
    t.string   "name_en"
    t.string   "name_jp"
    t.string   "code"
    t.text     "content_zh"
    t.text     "content_en"
    t.text     "content_jp"
    t.integer  "priority",   :default => 0
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["code"], :name => "index_pages_on_code"
  add_index "pages", ["position"], :name => "index_pages_on_position"
  add_index "pages", ["priority"], :name => "index_pages_on_priority"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.boolean  "is_top"
    t.integer  "category_id"
    t.integer  "comments_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id", "title"], :name => "index_posts_on_category_id_and_title"
  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["is_top"], :name => "index_posts_on_is_top"
  add_index "posts", ["title"], :name => "index_posts_on_title"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "product_photos", :force => true do |t|
    t.integer  "product_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_photos", ["product_id"], :name => "index_product_photos_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "priority",     :default => 0
    t.integer  "photos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["name"], :name => "index_products_on_name"
  add_index "products", ["priority"], :name => "index_products_on_priority"

  create_table "reports", :force => true do |t|
    t.integer  "user_id"
    t.text     "plan"
    t.text     "content"
    t.integer  "score"
    t.string   "comment"
    t.datetime "current_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["current_date"], :name => "index_reports_on_current_date"
  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["code"], :name => "index_roles_on_code"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "phone"
    t.datetime "birthdate"
    t.string   "gender"
    t.string   "position"
    t.text     "bio"
    t.boolean  "is_admin",                              :default => false
    t.integer  "events_count",                          :default => 0
    t.integer  "reports_count",                         :default => 0
    t.integer  "posts_count",                           :default => 0
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["is_admin"], :name => "index_users_on_is_admin"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "wikis", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "priority",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wikis", ["name"], :name => "index_wikis_on_name"
  add_index "wikis", ["priority"], :name => "index_wikis_on_priority"

end
