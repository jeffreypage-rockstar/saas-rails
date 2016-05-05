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

ActiveRecord::Schema.define(version: 20160505162433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.string   "uuid",        default: "uuid_generate_v4()"
    t.integer  "question_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "color",       default: "c5acd2"
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "email"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "responses_id"
  end

  add_index "comments", ["responses_id"], name: "index_comments_on_responses_id", using: :btree

  create_table "landing_pages", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "headline"
    t.string   "subtitle"
    t.integer  "survey_id"
    t.boolean  "comment_enabled", default: true
  end

  add_index "landing_pages", ["survey_id"], name: "index_landing_pages_on_survey_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.string   "identifier"
    t.integer  "price"
    t.integer  "response_limit", default: 0
    t.integer  "survey_limit",   default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "survey_id"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "comment"
  end

  add_index "responses", ["choice_id"], name: "index_responses_on_choice_id", using: :btree

  create_table "stripe_details", force: :cascade do |t|
    t.boolean  "trial_started", default: false
    t.string   "customer_id"
    t.string   "plan_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "trial_end"
    t.integer  "user_id"
  end

  add_index "stripe_details", ["user_id"], name: "index_stripe_details_on_user_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "user_id"
    t.datetime "active_until"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "customer_token"
    t.string   "subscription_token"
  end

  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "name",                           null: false
    t.integer  "landing_page_id"
    t.integer  "question_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.boolean  "notify_enabled",  default: true
    t.boolean  "active",          default: true
  end

  add_index "surveys", ["question_id"], name: "index_surveys_on_question_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",   null: false
    t.string   "project_title",          default: "",   null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                 default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
