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

ActiveRecord::Schema.define(version: 2018_11_02_135249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "costs", force: :cascade do |t|
    t.string "brand"
    t.string "category"
    t.string "modelo"
    t.string "color"
    t.string "medida"
    t.string "upc"
    t.decimal "precio_esp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "frame_color"
  end

  create_table "ebay_auths", force: :cascade do |t|
    t.string "user_id"
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "expiration"
    t.string "token_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frame_colors", force: :cascade do |t|
    t.integer "frame_width_id"
    t.integer "model_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frame_widths", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lens_colors", force: :cascade do |t|
    t.integer "frame_width_id"
    t.integer "frame_color_id"
    t.integer "model_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lens_materials", force: :cascade do |t|
    t.integer "frame_width_id"
    t.integer "frame_color_id"
    t.integer "model_id"
    t.integer "lens_color_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.integer "frame_width_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "url"
    t.string "upc"
    t.decimal "current_price"
    t.decimal "average_price"
    t.decimal "cost"
    t.decimal "gross_margin"
    t.decimal "net_margin"
    t.decimal "roi"
    t.string "name"
    t.integer "total_sold"
    t.integer "average_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
