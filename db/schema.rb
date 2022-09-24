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

ActiveRecord::Schema.define(version: 2022_09_17_122116) do

  create_table "boards", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "body", limit: 65535
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "board_image"
    t.integer "topic"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_bookmarks_on_board_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.integer "user_id"
    t.string "category_college"
    t.string "reason_college"
    t.text "schedule"
    t.string "major"
    t.text "major_detail"
    t.text "reason_major"
    t.text "friends"
    t.text "experience"
    t.text "challenge"
    t.text "difference_environment"
    t.text "difference_habits"
    t.text "reason_first_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_colleges_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", limit: 65535, null: false
    t.integer "board_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_comments_on_board_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "highschool_names", force: :cascade do |t|
    t.string "highschool"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "highschools", force: :cascade do |t|
    t.integer "user_id"
    t.string "character"
    t.text "good_at"
    t.text "bad_at"
    t.text "friends"
    t.text "feature_school"
    t.text "time_ratio"
    t.text "grades"
    t.text "subject_choice"
    t.text "reason_subject_choice"
    t.text "club_activities"
    t.text "hobby"
    t.text "dream"
    t.text "if_high_school_again"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_highschools_on_user_id"
  end

  create_table "nows", force: :cascade do |t|
    t.integer "user_id"
    t.string "age"
    t.string "job"
    t.text "job_detail"
    t.text "schedule"
    t.string "company"
    t.string "company_feature"
    t.text "ability_for_become"
    t.text "necesary_to_keep"
    t.text "good_point"
    t.text "hard_time"
    t.text "to_overcome"
    t.string "private_activity"
    t.string "string"
    t.text "time_ratio"
    t.integer "life_score"
    t.string "vision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "board_id"
    t.index ["board_id"], name: "index_nows_on_board_id"
    t.index ["user_id"], name: "index_nows_on_user_id"
  end

  create_table "reserve_times", force: :cascade do |t|
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "societies", force: :cascade do |t|
    t.integer "user_id"
    t.text "past_jobs"
    t.text "background"
    t.text "turning_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_societies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", limit: 1, default: 0, null: false
    t.integer "privacy", default: 0, null: false
    t.string "highschool_name", limit: 30
    t.string "nickname", limit: 30, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
