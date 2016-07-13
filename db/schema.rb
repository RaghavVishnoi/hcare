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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160712104253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associated_roles", force: :cascade do |t|
    t.integer  "object_id",   null: false
    t.integer  "role_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "object_type"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "center_likes", force: :cascade do |t|
    t.integer  "center_id"
    t.integer  "user_id"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "center_reviews", force: :cascade do |t|
    t.string   "review"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centers", force: :cascade do |t|
    t.string  "email"
    t.string  "contact_number",                null: false
    t.string  "website"
    t.text    "address",                       null: false
    t.string  "registration_number",           null: false
    t.string  "registered_by",                 null: false
    t.string  "owner_name",                    null: false
    t.string  "owner_contact_number"
    t.text    "owner_address"
    t.string  "owner_email"
    t.string  "contact_person",                null: false
    t.string  "contact_person_contact_number", null: false
    t.text    "contact_person_address",        null: false
    t.string  "working_hours",                 null: false
    t.string  "started_in",                    null: false
    t.string  "awards_and_achievements"
    t.integer "category_id",                   null: false
    t.string  "mfrom"
    t.string  "mto"
    t.string  "efrom"
    t.string  "eto"
    t.integer "user_id"
    t.string  "status"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "status"
  end

  create_table "first_aids", force: :cascade do |t|
    t.string   "symptoms"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "home_workouts", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_workout"
    t.string   "status"
  end

  create_table "images", force: :cascade do |t|
    t.string  "image",          null: false
    t.string  "lat"
    t.string  "long"
    t.string  "imageable_type"
    t.integer "imageable_id"
    t.string  "model"
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "request_id",   null: false
    t.integer  "user_id",      null: false
    t.string   "user_type",    null: false
    t.string   "message_type", null: false
    t.text     "content",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "target_id",  null: false
    t.integer  "user_id",    null: false
    t.boolean  "accept",     null: false
    t.boolean  "seen",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainer_likes", force: :cascade do |t|
    t.integer  "trainer_id",                null: false
    t.integer  "user_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: true
  end

  create_table "trainer_reviews", force: :cascade do |t|
    t.text     "review"
    t.integer  "rating",     null: false
    t.integer  "user_id",    null: false
    t.integer  "trainer_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainers", force: :cascade do |t|
    t.string  "name",                     null: false
    t.string  "personal_contact_number",  null: false
    t.string  "alternate_contact_number"
    t.string  "gender",                   null: false
    t.string  "email"
    t.text    "bio",                      null: false
    t.text    "awards_and_certificates"
    t.integer "category_id",              null: false
    t.text    "address",                  null: false
    t.string  "state",                    null: false
    t.string  "city",                     null: false
    t.string  "zip_code",                 null: false
    t.string  "status",                   null: false
    t.integer "user_id",                  null: false
    t.float   "latitude"
    t.float   "longitude"
    t.string  "profile_picture"
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "treatment"
    t.integer  "first_aid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "email",                           null: false
    t.string   "encrypted_password",  limit: 128, null: false
    t.string   "confirmation_token",  limit: 128
    t.string   "remember_token",      limit: 128, null: false
    t.string   "username"
    t.string   "gender"
    t.string   "facebook_user_id"
    t.text     "facebook_user_token"
    t.string   "photo_url"
    t.string   "contact_number"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "view_pagers", force: :cascade do |t|
    t.string "view_pager"
    t.string "status"
    t.string "url"
  end

  add_foreign_key "associated_roles", "roles"
  add_foreign_key "associated_roles", "users", column: "object_id"
  add_foreign_key "center_likes", "centers"
  add_foreign_key "center_likes", "users"
  add_foreign_key "center_reviews", "centers"
  add_foreign_key "center_reviews", "users"
  add_foreign_key "centers", "categories"
  add_foreign_key "centers", "users"
  add_foreign_key "messages", "requests"
  add_foreign_key "messages", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "requests", "users", column: "target_id"
  add_foreign_key "states", "countries"
  add_foreign_key "trainer_likes", "trainers"
  add_foreign_key "trainer_likes", "users"
  add_foreign_key "trainer_reviews", "trainers"
  add_foreign_key "trainer_reviews", "users"
  add_foreign_key "trainers", "categories"
  add_foreign_key "trainers", "users"
  add_foreign_key "treatments", "first_aids"
end
