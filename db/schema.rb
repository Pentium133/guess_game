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

ActiveRecord::Schema.define(version: 20180612112812) do

  create_table "predict_results", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "stage_id",   limit: 4
    t.boolean  "is_online",  limit: 1,     default: false
    t.integer  "score",      limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "place",      limit: 4
  end

  create_table "race_results", force: :cascade do |t|
    t.integer  "race_id",     limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "score",       limit: 4
    t.integer  "result_type", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "place",       limit: 4
  end

  create_table "races", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "season_id",  limit: 4
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "slug",       limit: 255
    t.integer  "race_type",  limit: 4,   default: 0
    t.boolean  "is_ready",   limit: 1,   default: false
  end

  create_table "rider_team_seasons", force: :cascade do |t|
    t.integer  "rider_id",       limit: 4
    t.integer  "team_season_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "riders", force: :cascade do |t|
    t.string   "last_name",  limit: 255
    t.string   "first_name", limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "tournament_id", limit: 4
    t.string   "name",          limit: 255
    t.date     "start_at"
    t.integer  "multiplier",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stage_predicts", force: :cascade do |t|
    t.integer  "stage_id",      limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "place",         limit: 4
    t.integer  "score",         limit: 4,   default: 0
    t.boolean  "guessed",       limit: 1,   default: false
    t.integer  "finisher_id",   limit: 4
    t.string   "finisher_type", limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "stage_predicts", ["finisher_type", "finisher_id"], name: "index_stage_predicts_on_finisher_type_and_finisher_id", using: :btree

  create_table "stage_results", force: :cascade do |t|
    t.integer  "stage_id",      limit: 4
    t.integer  "place",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "finisher_id",   limit: 4
    t.string   "finisher_type", limit: 255
  end

  add_index "stage_results", ["finisher_type", "finisher_id"], name: "index_stage_results_on_finisher_type_and_finisher_id", using: :btree

  create_table "stages", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "stage_number", limit: 4
    t.integer  "race_id",      limit: 4
    t.integer  "stage_type",   limit: 4,   default: 0
    t.datetime "start_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "winner_id",    limit: 4
    t.string   "slug",         limit: 255
    t.string   "profile",      limit: 255
  end

  create_table "team_seasons", force: :cascade do |t|
    t.integer  "team_id",    limit: 4
    t.integer  "season_id",  limit: 4
    t.string   "name",       limit: 255
    t.string   "logo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "short_name", limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role",                   limit: 4
    t.string   "username",               limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "slug",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
