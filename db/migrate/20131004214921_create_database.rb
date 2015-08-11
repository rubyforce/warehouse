class CreateDatabase < ActiveRecord::Migration
  def change
    create_table "active_admin_comments", force: true do |t|
      t.string   "namespace"
      t.text     "body"
      t.string   "resource_id",   null: false
      t.string   "resource_type", null: false
      t.integer  "author_id"
      t.string   "author_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

    create_table "activities", force: true do |t|
      t.integer  "trackable_id"
      t.string   "trackable_type"
      t.integer  "owner_id"
      t.string   "owner_type"
      t.string   "key"
      t.text     "parameters"
      t.integer  "recipient_id"
      t.string   "recipient_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

    create_table "admin_users", force: true do |t|
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

    create_table "authentications", force: true do |t|
      t.string   "provider",   null: false
      t.string   "uid",        null: false
      t.string   "email",      null: false
      t.integer  "user_id",    null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "carrier_wave_files", force: true do |t|
      t.string   "identifier"
      t.string   "original_filename"
      t.string   "content_type"
      t.string   "size"
      t.binary   "data"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "sessions", force: true do |t|
      t.string   "session_id", null: false
      t.text     "data"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
    add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

    create_table "users", force: true do |t|
      t.string   "email",                   default: "",        null: false
      t.string   "encrypted_password",      default: "",        null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",           default: 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "role"
      t.string   "status",                  default: "pending"
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
  end
end

