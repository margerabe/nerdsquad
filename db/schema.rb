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

ActiveRecord::Schema.define(version: 2020_11_25_131608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "boards", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 200.0
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height", default: 500.0
    t.float "width", default: 500.0
    t.integer "angle", default: 0
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "card_decks", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.boolean "blind?", default: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.float "height", default: 200.0
    t.float "width", default: 120.0
    t.integer "angle"
    t.index ["game_id"], name: "index_card_decks_on_game_id"
  end

  create_table "cards", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.string "visibility"
    t.bigint "card_deck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "position"
    t.float "height", default: 200.0
    t.float "width", default: 120.0
    t.integer "angle"
    t.index ["card_deck_id"], name: "index_cards_on_card_deck_id"
  end

  create_table "cboards", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 200.0
    t.bigint "clone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height", default: 500.0
    t.float "width", default: 500.0
    t.integer "angle", default: 0
    t.index ["clone_id"], name: "index_cboards_on_clone_id"
  end

  create_table "ccard_decks", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.boolean "blind?", default: false
    t.string "name"
    t.bigint "clone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height", default: 200.0
    t.float "width", default: 120.0
    t.integer "angle"
    t.index ["clone_id"], name: "index_ccard_decks_on_clone_id"
  end

  create_table "ccards", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.string "visibility"
    t.string "name"
    t.bigint "ccard_deck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.float "height", default: 200.0
    t.float "width", default: 120.0
    t.integer "angle"
    t.index ["ccard_deck_id"], name: "index_ccards_on_ccard_deck_id"
  end

  create_table "cdices", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.integer "faces"
    t.integer "number_of_dices"
    t.bigint "clone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height", default: 150.0
    t.float "width", default: 150.0
    t.integer "angle"
    t.integer "value", default: 1
    t.index ["clone_id"], name: "index_cdices_on_clone_id"
  end

  create_table "clones", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "number_of_players"
    t.integer "connected_players"
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_clones_on_game_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "gameroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gameroom_id"], name: "index_connections_on_gameroom_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "cpieces", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.string "name"
    t.bigint "clone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height", default: 50.0
    t.float "width", default: 50.0
    t.integer "angle", default: 0
    t.index ["clone_id"], name: "index_cpieces_on_clone_id"
  end

  create_table "ctokens", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.string "name"
    t.integer "number_of_tokens"
    t.bigint "clone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "height", default: 50.0
    t.float "width", default: 50.0
    t.integer "angle", default: 0
    t.index ["clone_id"], name: "index_ctokens_on_clone_id"
  end

  create_table "dices", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.integer "faces"
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_dices"
    t.float "height", default: 150.0
    t.float "width", default: 150.0
    t.integer "angle"
    t.integer "value", default: 1
    t.index ["game_id"], name: "index_dices_on_game_id"
  end

  create_table "gamerooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "clone_id"
    t.index ["clone_id"], name: "index_gamerooms_on_clone_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "number_of_players", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "saved", default: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "gameroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gameroom_id"], name: "index_messages_on_gameroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.float "height", default: 50.0
    t.float "width", default: 50.0
    t.integer "angle", default: 0
    t.index ["game_id"], name: "index_pieces_on_game_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.float "posX", default: 500.0
    t.float "posY", default: 500.0
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "number_of_tokens"
    t.float "height", default: 50.0
    t.float "width", default: 50.0
    t.integer "angle", default: 0
    t.index ["game_id"], name: "index_tokens_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "boards", "games"
  add_foreign_key "card_decks", "games"
  add_foreign_key "cards", "card_decks"
  add_foreign_key "cboards", "clones"
  add_foreign_key "ccard_decks", "clones"
  add_foreign_key "ccards", "ccard_decks"
  add_foreign_key "cdices", "clones"
  add_foreign_key "clones", "games"
  add_foreign_key "connections", "gamerooms"
  add_foreign_key "connections", "users"
  add_foreign_key "cpieces", "clones"
  add_foreign_key "ctokens", "clones"
  add_foreign_key "dices", "games"
  add_foreign_key "gamerooms", "clones"
  add_foreign_key "games", "users"
  add_foreign_key "messages", "gamerooms"
  add_foreign_key "messages", "users"
  add_foreign_key "pieces", "games"
  add_foreign_key "tokens", "games"
end
