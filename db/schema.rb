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

ActiveRecord::Schema.define(version: 20200812071306) do

  create_table "balance_bank_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "balance_bank_id"
    t.integer "balance_before"
    t.integer "balance_after"
    t.string "activity"
    t.string "ip"
    t.string "location"
    t.string "user_agent"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", limit: 6, default: "credit"
  end

  create_table "balance_banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "balance"
    t.integer "balance_achieve"
    t.string "code"
    t.boolean "enable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_balance_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_balance_id"
    t.string "type", limit: 6, default: "credit"
    t.integer "balance_before"
    t.integer "balance_after"
    t.string "activity"
    t.string "ip"
    t.string "location"
    t.string "user_agent"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_balances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "balance"
    t.integer "balance_achieve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
