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

ActiveRecord::Schema.define(version: 2021_01_14_192559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
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

  create_table "draft2images", force: :cascade do |t|
    t.bigint "draft_id"
    t.bigint "image_id"
    t.integer "rownum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draft_id"], name: "index_mdc.draft2images_on_draft_id"
    t.index ["image_id"], name: "index_mdc.draft2images_on_image_id"
  end

  create_table "drafts", force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "executor_programs", force: :cascade do |t|
    t.string "barcode_tech_process"
    t.integer "rownum_tech_process"
    t.bigint "employee_id"
    t.float "actual_machine_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_mdc.executor_programs_on_employee_id"
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
    t.string "config_hash"
    t.index ["hub_id"], name: "index_hub_configs_on_hub_id"
  end

  create_table "hubs", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "description"
    t.string "v_ver"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "device_list_available"
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "tech_operation_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tech_operations", force: :cascade do |t|
    t.string "name"
    t.bigint "tech_operation_type_id"
    t.float "scheduled_machine_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tech_operation_type_id"], name: "index_mdc.tech_operations_on_tech_operation_type_id"
  end

  create_table "tech_processes", force: :cascade do |t|
    t.string "barcode"
    t.bigint "tech_operation_id"
    t.integer "rownum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tech_operation_id"], name: "index_mdc.tech_processes_on_tech_operation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
