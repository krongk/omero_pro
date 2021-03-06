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

ActiveRecord::Schema.define(:version => 20111121165600003) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "cities", :force => true do |t|
    t.string  "name"
    t.string  "en_name"
    t.integer "region_id"
  end

  add_index "cities", ["region_id"], :name => "index_cities_on_region_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.date     "birth"
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.string   "confirm"
    t.string   "captcha"
    t.string   "is_deleted", :default => "n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.string  "name"
    t.string  "en_name"
    t.integer "city_id"
  end

  add_index "districts", ["city_id"], :name => "index_districts_on_city_id"

  create_table "jiamengs", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "phone"
    t.string   "address"
    t.string   "jiameng_address"
    t.string   "zijing"
    t.string   "dianpu"
    t.text     "message"
    t.string   "is_verfied",      :default => "n"
    t.string   "verfied_by"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_cates", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "news_cates", ["name"], :name => "index_news_cates_on_name", :unique => true

  create_table "news_items", :force => true do |t|
    t.integer  "news_cate_id"
    t.integer  "sort_id",       :default => 0, :null => false
    t.string   "title",                        :null => false
    t.text     "body"
    t.string   "external_path"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_items", ["news_cate_id"], :name => "index_news_items_on_news_cate_id"

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.string   "phone"
    t.string   "address"
    t.date     "order_time"
    t.integer  "order_count"
    t.text     "message"
    t.string   "code"
    t.string   "is_verfied",  :default => "n"
    t.string   "verfied_by"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "page_parts", :force => true do |t|
    t.integer "page_id"
    t.integer "part_id"
    t.integer "position", :default => 0
  end

  add_index "page_parts", ["page_id"], :name => "index_page_parts_on_page_id"
  add_index "page_parts", ["part_id"], :name => "index_page_parts_on_part_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id",        :default => 0
    t.integer  "position",         :default => 0
    t.string   "path_name"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "menu_match"
    t.integer  "show_in_menu",     :default => 1
    t.integer  "deletable",        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"
  add_index "pages", ["path_name"], :name => "index_pages_on_path_name", :unique => true
  add_index "pages", ["title"], :name => "index_pages_on_title"

  create_table "parts", :force => true do |t|
    t.string "title"
    t.text   "body"
  end

  add_index "parts", ["title"], :name => "index_parts_on_title", :unique => true

  create_table "product_cates", :force => true do |t|
    t.string "name"
  end

  create_table "product_items", :force => true do |t|
    t.integer  "product_cate_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "price",           :precision => 10, :scale => 2
    t.string   "image_path"
    t.integer  "sort_id",                                        :default => 0
    t.boolean  "is_visible",                                     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_items", ["product_cate_id"], :name => "index_product_items_on_product_cate_id"

  create_table "regions", :force => true do |t|
    t.string "name"
    t.string "en_name"
  end

  create_table "resource_cates", :force => true do |t|
    t.string "name"
  end

  create_table "resource_items", :force => true do |t|
    t.string   "resource_type"
    t.integer  "resource_cate_id"
    t.string   "resource_name"
    t.string   "resource_path"
    t.string   "resource_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_items", ["resource_cate_id"], :name => "index_resource_items_on_resource_cate_id"
  add_index "resource_items", ["resource_type"], :name => "index_resource_items_on_resource_type"

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.string   "short_address"
    t.string   "point"
    t.string   "tel_phone"
    t.string   "mobile_phone"
    t.string   "fax"
    t.string   "email"
    t.string   "qq"
    t.string   "bus_list"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["city_id"], :name => "index_shops_on_city_id"
  add_index "shops", ["district_id"], :name => "index_shops_on_district_id"
  add_index "shops", ["region_id"], :name => "index_shops_on_region_id"

  create_table "sites", :force => true do |t|
    t.string "name"
    t.string "value"
  end

  add_index "sites", ["name"], :name => "index_sites_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
