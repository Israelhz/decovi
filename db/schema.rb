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

ActiveRecord::Schema.define(version: 20170310213300) do

  create_table "pedidos", force: :cascade do |t|
    t.text     "tipo"
    t.text     "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "productos", force: :cascade do |t|
    t.text     "nombre"
    t.text     "acabado"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pedido_id"
    t.index ["pedido_id"], name: "index_productos_on_pedido_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "nombre"
    t.text     "apellidoPaterno"
    t.text     "apellidoMaterno"
    t.boolean  "aprobado",               default: false, null: false
    t.text     "paginaWeb"
    t.text     "notas"
    t.text     "puesto"
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "ventas",                 default: false, null: false
    t.boolean  "individuo",              default: false, null: false
    t.boolean  "empresa",                default: false, null: false
    t.boolean  "empleado",               default: false, null: false
    t.integer  "trabajaPara",            default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
