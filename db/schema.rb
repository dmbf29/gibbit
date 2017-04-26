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

ActiveRecord::Schema.define(version: 20170426073714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gibbers", force: :cascade do |t|
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
    t.string   "status"
    t.string   "first_name"
    t.index ["email"], name: "index_gibbers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_gibbers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "status",      default: "pending"
    t.text     "description"
    t.string   "photo"
    t.boolean  "live",        default: false
    t.integer  "credits",     default: 0
    t.integer  "user_id"
    t.integer  "gibber_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email"
    t.string   "first_name"
    t.integer  "price_cents", default: 400,       null: false
    t.json     "payment"
    t.integer  "rating",      default: 0,         null: false
    t.text     "review"
    t.index ["gibber_id"], name: "index_inquiries_on_gibber_id", using: :btree
    t.index ["user_id"], name: "index_inquiries_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "inquiry_id"
    t.string   "sender_type"
    t.integer  "sender_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["inquiry_id"], name: "index_messages_on_inquiry_id", using: :btree
    t.index ["sender_type", "sender_id"], name: "index_messages_on_sender_type_and_sender_id", using: :btree
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gibber_id"
    t.datetime "read_at"
    t.string   "action"
    t.string   "notifiable_id"
    t.string   "integer"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["gibber_id"], name: "index_notices_on_gibber_id", using: :btree
    t.index ["user_id"], name: "index_notices_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.integer  "inquiry_id"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["inquiry_id"], name: "index_orders_on_inquiry_id", using: :btree
  end

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
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "credits"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "inquiries", "gibbers"
  add_foreign_key "inquiries", "users"
  add_foreign_key "messages", "inquiries"
  add_foreign_key "notices", "gibbers"
  add_foreign_key "notices", "users"
  add_foreign_key "orders", "inquiries"
end
