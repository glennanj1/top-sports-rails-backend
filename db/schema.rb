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

ActiveRecord::Schema.define(version: 2021_04_17_193238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer "amount"
    t.string "team"
    t.integer "odds"
    t.datetime "date"
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_bets_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "sport_nice"
    t.string "teams"
    t.string "home_team"
    t.datetime "commence_time"
    t.string "sites"
    t.bigint "sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "odds"
    t.string "odds1"
    t.index ["sport_id"], name: "index_games_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "key"
    t.boolean "active"
    t.string "group"
    t.string "details"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bets", "games"
  add_foreign_key "games", "sports"
end
