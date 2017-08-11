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

ActiveRecord::Schema.define(version: 20170811084145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktailloaders", force: :cascade do |t|
    t.integer  "idDrink"
    t.string   "strDrink"
    t.string   "strCategory"
    t.string   "strAlcoholic"
    t.string   "strGlass"
    t.string   "strInstructions"
    t.string   "strDrinkThumb"
    t.string   "strIngredient1"
    t.string   "strMeasure1"
    t.string   "strIngredient2"
    t.string   "strMeasure2"
    t.string   "strIngredient3"
    t.string   "strMeasure3"
    t.string   "strIngredient4"
    t.string   "strMeasure4"
    t.string   "strIngredient5"
    t.string   "strMeasure5"
    t.string   "strIngredient6"
    t.string   "strMeasure6"
    t.string   "strIngredient7"
    t.string   "strMeasure7"
    t.string   "strIngredient8"
    t.string   "strMeasure8"
    t.string   "strIngredient9"
    t.string   "strMeasure9"
    t.string   "strIngredient10"
    t.string   "strMeasure10"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "mrcock_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
    t.string   "category"
    t.string   "votes"
  end

  create_table "doses", force: :cascade do |t|
    t.string   "description"
    t.integer  "ingredient_id"
    t.integer  "cocktail_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cocktail_id"], name: "index_doses_on_cocktail_id", using: :btree
    t.index ["ingredient_id"], name: "index_doses_on_ingredient_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "doses", "cocktails"
  add_foreign_key "doses", "ingredients"
end
