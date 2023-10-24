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

ActiveRecord::Schema[7.0].define(version: 2023_10_24_145809) do
  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.integer "attack_points"
    t.integer "defense_points"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fight_participation_equipments", force: :cascade do |t|
    t.integer "fight_participation_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_fight_participation_equipments_on_equipment_id"
    t.index ["fight_participation_id"], name: "index_fight_participation_equipments_on_fight_participation_id"
  end

  create_table "fight_participations", force: :cascade do |t|
    t.integer "fight_id", null: false
    t.integer "fighter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_id"], name: "index_fight_participations_on_fight_id"
    t.index ["fighter_id"], name: "index_fight_participations_on_fighter_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "life_points"
    t.integer "attack_points"
    t.integer "experience_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "hits", force: :cascade do |t|
    t.integer "fight_participation_equipment_id"
    t.integer "fight_participation_id", null: false
    t.integer "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_participation_equipment_id"], name: "index_hits_on_fight_participation_equipment_id"
    t.index ["fight_participation_id"], name: "index_hits_on_fight_participation_id"
  end

  add_foreign_key "fight_participation_equipments", "equipment"
  add_foreign_key "fight_participation_equipments", "fight_participations"
  add_foreign_key "fight_participations", "fighters"
  add_foreign_key "fight_participations", "fights"
  add_foreign_key "fights", "fighters", column: "winner_id"
  add_foreign_key "hits", "fight_participation_equipments"
  add_foreign_key "hits", "fight_participations"
end
