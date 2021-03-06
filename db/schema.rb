# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_03_122730) do

  create_table "candidates", force: :cascade do |t|
    t.string "cedula"
    t.string "name"
    t.integer "job_id", null: false
    t.float "desired_wage"
    t.string "recommended_by"
    t.json "experience"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_candidates_on_job_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "candidates_languages", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "language_id"
    t.index ["candidate_id"], name: "index_candidates_languages_on_candidate_id"
    t.index ["language_id"], name: "index_candidates_languages_on_language_id"
  end

  create_table "candidates_skills", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "skill_id"
    t.index ["candidate_id"], name: "index_candidates_skills_on_candidate_id"
    t.index ["skill_id"], name: "index_candidates_skills_on_skill_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "cedula"
    t.string "name"
    t.date "hired_date"
    t.integer "job_id", null: false
    t.integer "candidate_id", null: false
    t.float "wage"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_employees_on_candidate_id"
    t.index ["job_id"], name: "index_employees_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.string "risk_level"
    t.float "wage_min"
    t.float "wage_max"
    t.boolean "status"
    t.integer "candidate_id"
    t.integer "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_jobs_on_candidate_id"
    t.index ["department_id"], name: "index_jobs_on_department_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "description"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string "description"
    t.string "level"
    t.date "from_at"
    t.date "to_at"
    t.string "institution"
    t.integer "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_trainings_on_candidate_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "group", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "candidates", "jobs"
  add_foreign_key "candidates", "users"
  add_foreign_key "employees", "candidates"
  add_foreign_key "employees", "jobs"
  add_foreign_key "trainings", "candidates"
end
