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

ActiveRecord::Schema.define(version: 20150930111654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "authentications", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "email",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carrier_wave_files", force: :cascade do |t|
    t.string   "identifier"
    t.string   "original_filename"
    t.string   "content_type"
    t.string   "size"
    t.binary   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_no"
    t.string   "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "containers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "device_id"
    t.string   "other_info"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_salaries", force: :cascade do |t|
    t.decimal  "salary_rate"
    t.integer  "employee_id"
    t.integer  "salary_id"
    t.text     "remark"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "gender"
    t.string   "marital_status"
    t.string   "year"
    t.string   "paid_type"
    t.text     "address"
    t.string   "contact_no"
    t.string   "qualification"
    t.string   "entry_no"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "paid_type_id"
    t.decimal  "salary_rate"
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "grievances", force: :cascade do |t|
    t.date     "date"
    t.text     "note"
    t.string   "voucher_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.string   "reason"
  end

  create_table "item_rate_masters", force: :cascade do |t|
    t.decimal  "rate"
    t.integer  "item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "rate_master_id"
    t.string   "name"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "min_qty"
    t.integer  "package_type_id"
    t.integer  "container_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.decimal  "tax"
    t.decimal  "rate"
  end

  create_table "ledgers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outstanding_payments", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "date"
    t.decimal  "cash"
    t.string   "cheque_no"
    t.string   "bank_name"
    t.string   "payment_method"
    t.date     "bank_date"
    t.integer  "stock_outward_id"
  end

  create_table "package_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paid_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_vouchers", force: :cascade do |t|
    t.string   "voucher_no"
    t.date     "date"
    t.decimal  "amount"
    t.boolean  "payment_method", default: false
    t.string   "cheque_no"
    t.string   "bank_name"
    t.decimal  "cash"
    t.string   "ledger_name"
    t.string   "details"
    t.integer  "ledger_id"
    t.integer  "employee_id"
    t.integer  "expense_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status"
    t.integer  "numeral"
    t.date     "bank_date"
  end

  create_table "rate_masters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.decimal  "qty"
    t.string   "reason"
    t.integer  "item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "item_name"
    t.integer  "grievance_id"
    t.integer  "numeral"
  end

  create_table "requisition_items", force: :cascade do |t|
    t.decimal  "qty"
    t.integer  "numeral"
    t.integer  "item_id"
    t.integer  "warehouse_id"
    t.integer  "company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "item_name"
    t.string   "company_name"
    t.string   "warehouse_name"
    t.integer  "requisition_id"
  end

  create_table "requisitions", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "date"
    t.string   "requisition_no"
  end

  create_table "salaries", force: :cascade do |t|
    t.string   "month"
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "stock_inward_items", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "item_id"
    t.integer  "warehouse_id"
    t.integer  "stock_inward_id"
    t.integer  "numeral"
    t.decimal  "qty"
    t.decimal  "s_qty"
    t.decimal  "purchase_rate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "item_name"
    t.string   "company_name"
    t.string   "warehouse_name"
    t.decimal  "amount"
    t.decimal  "sum_taxes"
  end

  create_table "stock_inwards", force: :cascade do |t|
    t.date     "date"
    t.string   "requisition_ref"
    t.string   "voucher_no"
    t.text     "note"
    t.string   "invoice_no"
    t.decimal  "amount"
    t.string   "cheque_no"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "amount_paid",     default: false
    t.decimal  "discount"
    t.decimal  "total"
  end

  create_table "stock_outward_items", force: :cascade do |t|
    t.integer  "ledger_id"
    t.integer  "item_id"
    t.integer  "warehouse_id"
    t.integer  "stock_outward_id"
    t.decimal  "qty"
    t.decimal  "s_qty"
    t.decimal  "discount"
    t.string   "ledger_name"
    t.string   "item_name"
    t.string   "warehouse_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "device_id_name"
    t.integer  "device_id"
    t.integer  "numeral"
  end

  create_table "stock_outwards", force: :cascade do |t|
    t.date     "date"
    t.string   "invoice_no"
    t.string   "voucher_no"
    t.decimal  "cash"
    t.string   "cheque_no"
    t.string   "bank_name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "credit"
    t.string   "discount"
    t.string   "payment_method"
    t.date     "bank_date"
    t.integer  "outstanding_payment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "status",                 default: "pending"
    t.string   "avatar"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "phone"
    t.string   "street"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "state"
    t.text     "short_bio"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "google_plus_link"
    t.string   "linkedin_link"
    t.string   "social_avatar_url"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "facebook_avatar"
    t.string   "google_plus_avatar"
    t.string   "linkedin_avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "reg_no"
    t.integer  "vehicle_company_id"
    t.date     "date_of_purchase"
    t.date     "insurance_renewal"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
