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

ActiveRecord::Schema.define(version: 20160805203901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "attachment",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attachable_id"
    t.string   "attachable_type", limit: 255
  end

  add_index "attachments", ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type", using: :btree

  create_table "churches", force: :cascade do |t|
    t.string   "name",          limit: 510
    t.string   "bras_code",     limit: 510
    t.string   "heritage_code", limit: 510
    t.string   "2000_code",     limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.string   "picture",       limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.text     "commentable_type"
    t.integer  "commentable_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_archived",      default: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.integer  "order"
    t.boolean  "is_mandatory",                           default: true
    t.boolean  "is_active",                              default: true
    t.datetime "created_at",               precision: 6
    t.datetime "updated_at",               precision: 6
    t.string   "code",         limit: 255
    t.string   "short_name",   limit: 255
    t.boolean  "is_expirable",                           default: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "document_type_id"
    t.datetime "expires_at"
    t.boolean  "is_possible"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "documentable_id"
    t.string   "documentable_type",     limit: 255
    t.integer  "attachments_count",                 default: 0
    t.string   "number",                limit: 255
    t.datetime "issue_date"
    t.integer  "active_requests_count"
    t.string   "status_id"
    t.integer  "comments_count",                    default: 0
  end

  add_index "documents", ["document_type_id"], name: "index_documents_on_document_type_id", using: :btree
  add_index "documents", ["documentable_id"], name: "index_documents_on_documentable_id", using: :btree

  create_table "good_types_materials", id: false, force: :cascade do |t|
    t.integer "good_type_id", default: 0
    t.integer "material_id",  default: 0
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_readonly"
    t.integer  "group_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", force: :cascade do |t|
    t.integer "good_id"
    t.integer "church_id"
    t.integer "invoice_id"
    t.string  "epc_rfid",               limit: 510
    t.string  "codigo_interno",         limit: 510
    t.string  "objeto",                 limit: 510
    t.string  "quantidade",             limit: 510
    t.string  "marca",                  limit: 510
    t.string  "modelo",                 limit: 510
    t.string  "num_serie",              limit: 510
    t.string  "altura",                 limit: 510
    t.string  "largura",                limit: 510
    t.string  "comprimento",            limit: 510
    t.string  "material",               limit: 510
    t.string  "potencia",               limit: 510
    t.string  "tensao",                 limit: 510
    t.string  "localizacao",            limit: 510
    t.string  "ano_contabil",           limit: 510
    t.string  "conta_contabil",         limit: 510
    t.string  "mes_arquivo",            limit: 510
    t.string  "pacote_arquivo",         limit: 510
    t.string  "num_nf",                 limit: 510
    t.string  "data_nf",                limit: 510
    t.string  "fornecedor",             limit: 510
    t.string  "valor_bem",              limit: 510
    t.string  "observacao",             limit: 510
    t.string  "conta_contabil_correta", limit: 510
  end

  create_table "mouths", id: false, force: :cascade do |t|
    t.integer "id",               default: "nextval('mouths_id_seq'::regclass)", null: false
    t.string  "nome", limit: 100
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level"
  end

  create_table "profiles_skills", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "code",              limit: 255
    t.integer  "church_id"
    t.string   "group_code",        limit: 255
    t.string   "accountant_code",   limit: 255
    t.string   "cartographic_code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",                                              default: true
    t.boolean  "has_church",                                             default: false
    t.decimal  "market_price",                  precision: 10, scale: 2
    t.json     "object"
    t.string   "title",             limit: 255
    t.string   "category",          limit: 64
    t.string   "status",            limit: 64
    t.string   "situation",         limit: 64
    t.string   "address",           limit: 256
    t.string   "zipcode",           limit: 9
    t.string   "zone",              limit: 12
    t.integer  "income"
    t.string   "quarter",           limit: 12
    t.string   "court",             limit: 12
    t.string   "lot",               limit: 12
    t.decimal  "terrain_area",                  precision: 12, scale: 2
    t.decimal  "width_area",                    precision: 12, scale: 2
    t.decimal  "main_area",                     precision: 12, scale: 2
    t.decimal  "trash_area",                    precision: 12, scale: 2
    t.decimal  "secondary_area",                precision: 12, scale: 2
    t.decimal  "excess_area",                   precision: 12, scale: 2
    t.string   "default_type",      limit: 64
    t.string   "default_category",  limit: 64
    t.decimal  "rate",                          precision: 12, scale: 2
    t.text     "comment"
    t.text     "object_terrain"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "full_address",      limit: 255
    t.string   "tax_code",          limit: 255
  end

  add_index "properties", ["church_id"], name: "index_properties_on_church_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.datetime "requested_at"
    t.datetime "returned_at"
    t.datetime "return_in"
    t.boolean  "is_active"
    t.integer  "user_id"
    t.text     "requestable_type"
    t.integer  "requestable_id"
    t.text     "requester"
    t.text     "requester_phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "requester_church"
    t.text     "comment"
    t.json     "meta"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",        limit: 510
    t.string   "model",       limit: 510
    t.string   "name_pt_br",  limit: 510
    t.string   "model_pt_br", limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", primary_key: "uid", force: :cascade do |t|
    t.string   "statusable_type", null: false
    t.string   "title",           null: false
    t.string   "color"
    t.boolean  "is_active"
    t.string   "description"
    t.integer  "order"
    t.json     "meta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "token",      limit: 255
    t.integer  "user_id"
    t.datetime "expire_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["token"], name: "index_tokens_on_token", using: :btree
  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 510, default: "", null: false
    t.string   "encrypted_password",     limit: 510, default: "", null: false
    t.string   "reset_password_token",   limit: 510
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 510
    t.string   "last_sign_in_ip",        limit: 510
    t.integer  "group_id"
    t.boolean  "is_admin"
    t.integer  "church_id"
    t.integer  "profile_id"
    t.string   "first_name",             limit: 510
    t.string   "last_name",              limit: 510
  end

  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "users_reset_password_token_key", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 510, null: false
    t.integer  "item_id",                null: false
    t.string   "event",      limit: 510, null: false
    t.string   "whodunnit",  limit: 510
    t.text     "object"
    t.datetime "created_at"
  end

  create_table "voltages", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
