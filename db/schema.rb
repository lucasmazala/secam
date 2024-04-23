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

ActiveRecord::Schema[7.1].define(version: 2024_04_07_201951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cooperators_tickets", id: false, force: :cascade do |t|
    t.bigint "cooperator_id", null: false
    t.bigint "ticket_id", null: false
    t.index ["cooperator_id", "ticket_id"], name: "index_cooperators_tickets_on_cooperator_id_and_ticket_id"
    t.index ["ticket_id", "cooperator_id"], name: "index_cooperators_tickets_on_ticket_id_and_cooperator_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "priority"
    t.date "execution_date"
    t.time "execution_time"
    t.string "execution_place"
    t.string "registered_by"
    t.string "ticket_purpose"
    t.string "service_type"
    t.text "observation"
    t.string "service_progress"
    t.string "ticket_situation"
    t.integer "service_evaluation"
    t.text "suggestions_complaints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "requester_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "coordination"
    t.string "telephone"
    t.string "email", null: false
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "tickets", "users", column: "requester_id"
end
