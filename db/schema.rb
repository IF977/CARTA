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

ActiveRecord::Schema.define(version: 20160514151715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "name"
    t.json     "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dish_attachments", force: :cascade do |t|
    t.integer  "dish_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json     "images"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "ingredients"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dishes_orders", id: false, force: :cascade do |t|
    t.integer "dish_id"
    t.integer "order_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "namep"
    t.integer  "qtd"
    t.string   "price"
    t.string   "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "manage_id"
  end

  create_table "manages", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "ingredient"
    t.json     "pictures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manages_orders", id: false, force: :cascade do |t|
    t.integer "manage_id"
    t.integer "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "n_order"
    t.string   "price"
    t.string   "n_table"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "list_id"
  end

end
