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

ActiveRecord::Schema.define(version: 20151203020713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invites", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "token"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "list_id"
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "listings", ["list_id"], name: "index_listings_on_list_id", using: :btree
  add_index "listings", ["movie_id"], name: "index_listings_on_movie_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lists", ["owner_id"], name: "index_lists_on_owner_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["list_id"], name: "index_memberships_on_list_id", using: :btree
  add_index "memberships", ["member_id"], name: "index_memberships_on_member_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tmdb_id"
    t.string   "imdb_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "rating"
    t.text     "review"
    t.boolean  "seen"
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["movie_id"], name: "index_notes_on_movie_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["movie_id"], name: "index_taggings_on_movie_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["user_id"], name: "index_tags_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "listings", "lists"
  add_foreign_key "listings", "movies"
  add_foreign_key "lists", "users", column: "owner_id"
  add_foreign_key "memberships", "lists"
  add_foreign_key "memberships", "users", column: "member_id"
  add_foreign_key "notes", "movies"
  add_foreign_key "notes", "users"
  add_foreign_key "taggings", "movies"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "users"
end
