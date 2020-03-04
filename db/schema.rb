# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_04_111257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "link_maps", force: :cascade do |t|
    t.string "original_url"
    t.string "short_data"
    t.integer "clicks", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["original_url"], name: "index_link_maps_on_original_url", unique: true
    t.index ["short_data"], name: "index_link_maps_on_short_data", unique: true
  end

end
