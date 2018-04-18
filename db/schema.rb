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

ActiveRecord::Schema.define(version: 20180416050300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countdowns", force: :cascade do |t|
    t.integer "lockout_seconds"
    t.integer "lockout_increment"
    t.integer "guesses"
    t.string "code"
    t.bigint "purchased_game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seconds"
    t.float "total_time"
    t.datetime "lockout_started_at"
    t.index ["purchased_game_id"], name: "index_countdowns_on_purchased_game_id"
  end

  create_table "cover_photos", force: :cascade do |t|
    t.bigint "game_id"
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_cover_photos_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "teaser"
    t.text "included"
    t.text "not_included"
    t.string "difficulty"
    t.integer "price"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.integer "player_min"
    t.integer "player_max"
    t.integer "play_time"
    t.integer "prep_time"
    t.string "packet_file_name"
    t.string "packet_content_type"
    t.integer "packet_file_size"
    t.datetime "packet_updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total"
    t.boolean "complete"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "purchased_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "caption"
    t.string "url"
    t.date "date_taken"
    t.bigint "game_id"
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_photos_on_game_id"
  end

  create_table "purchased_games", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "order_id"
    t.integer "subtotal"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_purchased_games_on_game_id"
    t.index ["order_id"], name: "index_purchased_games_on_order_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.text "description"
    t.string "author"
    t.date "date"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_testimonials_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "countdowns", "purchased_games"
  add_foreign_key "cover_photos", "games"
  add_foreign_key "orders", "users"
  add_foreign_key "photos", "games"
  add_foreign_key "purchased_games", "games"
  add_foreign_key "purchased_games", "orders"
  add_foreign_key "testimonials", "games"
end
