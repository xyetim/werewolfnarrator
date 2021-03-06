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

ActiveRecord::Schema.define(version: 20180405152840) do

  create_table "games", force: :cascade do |t|
    t.integer "num_players"
    t.integer "current_phase", default: 0
    t.text "roles"
    t.text "night_targets"
    t.boolean "in_phase_transition"
    t.integer "night_count", default: 0
    t.integer "music_pid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.integer "game_id"
    t.string "response"
    t.boolean "alive", default: true
    t.boolean "mayor", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

end
