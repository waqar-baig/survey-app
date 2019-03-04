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

ActiveRecord::Schema.define(version: 20190303145937) do

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_customers_on_merchant_id"
  end

  create_table "feedback_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "feedback_id"
    t.bigint "question_id"
    t.integer "rating"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_id"], name: "index_feedback_answers_on_feedback_id"
    t.index ["question_id"], name: "index_feedback_answers_on_question_id"
  end

  create_table "feedback_forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.integer "status"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_feedback_forms_on_merchant_id"
  end

  create_table "feedback_forms_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "feedback_form_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_form_id"], name: "index_feedback_forms_questions_on_feedback_form_id"
    t.index ["question_id"], name: "index_feedback_forms_questions_on_question_id"
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id"
    t.bigint "merchant_id"
    t.bigint "feedback_form_id"
    t.integer "status"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_feedbacks_on_customer_id"
    t.index ["feedback_form_id"], name: "index_feedbacks_on_feedback_form_id"
    t.index ["merchant_id"], name: "index_feedbacks_on_merchant_id"
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_merchants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true
  end

  create_table "question_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "question_id"
    t.integer "rating"
    t.string "answer_label"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_question_answers_on_merchant_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.integer "question_type"
    t.boolean "is_required"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_questions_on_merchant_id"
  end

  add_foreign_key "customers", "merchants"
  add_foreign_key "feedback_answers", "feedbacks"
  add_foreign_key "feedback_answers", "questions"
  add_foreign_key "feedback_forms", "merchants"
  add_foreign_key "feedback_forms_questions", "feedback_forms"
  add_foreign_key "feedback_forms_questions", "questions"
  add_foreign_key "feedbacks", "customers"
  add_foreign_key "feedbacks", "feedback_forms"
  add_foreign_key "feedbacks", "merchants"
  add_foreign_key "question_answers", "merchants"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "questions", "merchants"
end
