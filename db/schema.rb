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

ActiveRecord::Schema.define(:version => 20121227204300) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "accounts_users", :id => false, :force => true do |t|
    t.integer "account_id"
    t.integer "user_id"
  end

  add_index "accounts_users", ["account_id", "user_id"], :name => "index_accounts_users_on_account_id_and_user_id"

  create_table "activities", :force => true do |t|
    t.datetime "datetime"
    t.text     "description"
    t.string   "status"
    t.integer  "activitable_id"
    t.string   "activitable_type"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "activities", ["account_id"], :name => "index_activities_on_account_id"
  add_index "activities", ["datetime", "account_id"], :name => "index_activities_on_datetime_and_account_id"
  add_index "activities", ["datetime", "activitable_id", "activitable_type"], :name => "index_activities_on_datetime_and_activitable"
  add_index "activities", ["status", "account_id"], :name => "index_activities_on_status_and_account_id"
  add_index "activities", ["status", "activitable_id", "activitable_type"], :name => "index_activities_on_status_and_activitable"

  create_table "address_infos", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "type"
    t.boolean  "preferable"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "catalogs", :force => true do |t|
    t.string   "item"
    t.text     "description"
    t.float    "price"
    t.boolean  "active"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "catalogs", ["account_id"], :name => "index_catalogs_on_account_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "trading_name"
    t.string   "image"
    t.integer  "employees"
    t.float    "annual_income"
    t.string   "industry"
    t.text     "notes"
    t.boolean  "public"
    t.boolean  "active"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "companies", ["account_id"], :name => "index_companies_on_account_id"

  create_table "contact_infos", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "type"
    t.boolean  "preferable"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "source_id"
    t.date     "date"
    t.string   "name"
    t.string   "image"
    t.date     "birthdate"
    t.string   "type"
    t.text     "notes"
    t.boolean  "public"
    t.boolean  "active"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["account_id"], :name => "index_contacts_on_account_id"
  add_index "contacts", ["source_id"], :name => "index_contacts_on_source_id"

  create_table "deals", :force => true do |t|
    t.date     "date"
    t.string   "stage"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "deals", ["account_id"], :name => "index_deals_on_account_id"

  create_table "document_infos", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "type"
    t.boolean  "preferable"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.string   "listable_item"
    t.string   "listable_type"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "lists", ["account_id"], :name => "index_lists_on_account_id"
  add_index "lists", ["listable_item", "listable_type", "account_id"], :name => "index_lists_on_listable_item_and_listable_type_and_account_id"

  create_table "online_infos", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "type"
    t.boolean  "preferable"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "professionals", :force => true do |t|
    t.integer  "company_id"
    t.string   "position"
    t.boolean  "primary_contact"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "contact_id"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "professionals", ["company_id"], :name => "index_professionals_on_company_id"
  add_index "professionals", ["contact_id"], :name => "index_professionals_on_contact_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.boolean  "active"
    t.integer  "account_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sources", ["account_id"], :name => "index_sources_on_account_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
