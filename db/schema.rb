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

ActiveRecord::Schema.define(version: 20141114174800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "type"
    t.integer  "section_id"
    t.integer  "position"
    t.integer  "page_id"
    t.string   "page_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["page_id", "page_type"], name: "index_activities_on_page_id_and_page_type", using: :btree
  add_index "activities", ["section_id"], name: "index_activities_on_section_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "subject"
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "page_content_id"
  end

  add_index "courses", ["page_content_id"], name: "index_courses_on_page_content_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "fill_in_blank_answers", force: true do |t|
    t.string   "text"
    t.integer  "fill_in_blank_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fill_in_blank_answers", ["fill_in_blank_question_id"], name: "index_fill_in_blank_answers_on_fill_in_blank_question_id", using: :btree

  create_table "fill_in_blank_questions", force: true do |t|
    t.integer  "page_content_id"
    t.integer  "fill_in_blank_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fill_in_blank_questions", ["fill_in_blank_answer_id"], name: "index_fill_in_blank_questions_on_fill_in_blank_answer_id", using: :btree
  add_index "fill_in_blank_questions", ["page_content_id"], name: "index_fill_in_blank_questions_on_page_content_id", using: :btree

  create_table "lesson_activities", force: true do |t|
    t.integer  "page_content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lesson_activities", ["page_content_id"], name: "index_lesson_activities_on_page_content_id", using: :btree

  create_table "page_contents", force: true do |t|
    t.text     "content"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "page_content_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["answer_id"], name: "index_questions_on_answer_id", using: :btree
  add_index "questions", ["page_content_id"], name: "index_questions_on_page_content_id", using: :btree

  create_table "quiz_activities", force: true do |t|
    t.integer  "question_id"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_activities", ["question_id", "question_type"], name: "index_quiz_activities_on_question_id_and_question_type", using: :btree

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
