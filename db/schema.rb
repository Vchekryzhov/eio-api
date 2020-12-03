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

ActiveRecord::Schema.define(version: 2020_12_03_194823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_nodes", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_device_nodes_on_device_id"
    t.index ["node_id"], name: "index_device_nodes_on_node_id"
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.bigint "device_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_type_id"], name: "index_devices_on_device_type_id"
  end

  create_table "documentations", force: :cascade do |t|
    t.string "title"
    t.string "file"
    t.bigint "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_documentations_on_machine_id"
  end

  create_table "group_inputs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_types", force: :cascade do |t|
    t.string "title"
    t.string "kind", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind"], name: "index_group_types_on_kind", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_type_id"
    t.bigint "device_id"
    t.index ["device_id"], name: "index_groups_on_device_id"
    t.index ["group_type_id"], name: "index_groups_on_group_type_id"
    t.index ["parent_id"], name: "index_groups_on_parent_id"
  end

  create_table "hub2devices", force: :cascade do |t|
    t.string "hub_id"
    t.bigint "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_hub2devices_on_device_id"
    t.index ["hub_id"], name: "index_hub2devices_on_hub_id"
  end

  create_table "hub_configs", force: :cascade do |t|
    t.string "hub_id"
    t.jsonb "config"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "config_hash_crc32"
    t.index ["hub_id"], name: "index_hub_configs_on_hub_id"
  end

  create_table "hubs", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "description"
    t.string "v_ver"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "device_list_available"
  end

  create_table "input_types", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "kind", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit"
    t.index ["kind"], name: "index_input_types_on_kind", unique: true
  end

  create_table "inputs", force: :cascade do |t|
    t.bigint "device_id"
    t.string "name"
    t.string "value"
    t.boolean "is_error", default: false
    t.string "message_error"
    t.string "hint_error"
    t.datetime "client_time"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "input_type"
    t.bigint "group_id"
    t.string "unit"
    t.bigint "input_type_id"
    t.index ["device_id"], name: "index_inputs_on_device_id"
    t.index ["group_id"], name: "index_inputs_on_group_id"
    t.index ["input_type_id"], name: "index_inputs_on_input_type_id"
    t.index ["request_id"], name: "index_inputs_on_request_id"
  end

  create_table "machine_data", force: :cascade do |t|
    t.bigint "machine_id"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_machine_data_on_created_at"
    t.index ["machine_id"], name: "index_machine_data_on_machine_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "title", null: false
    t.string "model", null: false
    t.string "machine_type", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "node2departs", force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_node2departs_on_department_id"
    t.index ["node_id"], name: "index_node2departs_on_node_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "preview_description"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_color"
  end

  create_table "requests", force: :cascade do |t|
    t.jsonb "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "youtube_url"
    t.bigint "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_reviews_on_machine_id"
  end

end
