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

ActiveRecord::Schema.define(version: 20151229144319) do

  create_table "kecamatans", force: true do |t|
    t.string "nama"
  end

  create_table "kelurahans", force: true do |t|
    t.integer "kecamatan_id"
    t.string  "nama"
  end

  add_index "kelurahans", ["kecamatan_id"], name: "index_kelurahans_on_kecamatan_id", using: :btree

  create_table "rekapitulasis", force: true do |t|
    t.integer "entity_id"
    t.string  "entity_type"
    t.string  "pemilih"
    t.string  "pengguna_hak_pilih"
    t.string  "perolehan_suara_1"
    t.string  "perolehan_suara_2"
    t.string  "suara_sah"
    t.string  "suara_tidak_sah"
    t.string  "total_suara"
    t.string  "data_masuk"
  end

  add_index "rekapitulasis", ["entity_id", "entity_type"], name: "index_rekapitulasis_on_entity_id_and_entity_type", using: :btree

  create_table "tps", force: true do |t|
    t.integer "kelurahan_id"
    t.string  "nama"
  end

  add_index "tps", ["kelurahan_id"], name: "index_tps_on_kelurahan_id", using: :btree

end
