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

ActiveRecord::Schema.define(version: 20170407170956) do

  create_table "contents", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "direcciones_entregas", force: :cascade do |t|
    t.string   "estado"
    t.string   "municipio"
    t.string   "colonia"
    t.integer  "numero"
    t.integer  "cp"
    t.string   "telefono"
    t.text     "notas"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_direcciones_entregas_on_user_id"
  end

  create_table "direcciones_facturas", force: :cascade do |t|
    t.string   "estado"
    t.string   "municipio"
    t.string   "colonia"
    t.integer  "numero"
    t.integer  "cp"
    t.string   "rfc"
    t.text     "notas"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_direcciones_facturas_on_user_id"
  end

  create_table "facturas", force: :cascade do |t|
    t.text     "folio"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "pedido_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "pedidos", force: :cascade do |t|
    t.text     "tipo"
    t.text     "estatus"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "razones_comerciale_id"
    t.integer  "razones_sociale_id"
    t.integer  "direcciones_entrega_id"
    t.integer  "direcciones_factura_id"
    t.index ["direcciones_entrega_id"], name: "index_pedidos_on_direcciones_entrega_id"
    t.index ["direcciones_factura_id"], name: "index_pedidos_on_direcciones_factura_id"
    t.index ["razones_comerciale_id"], name: "index_pedidos_on_razones_comerciale_id"
    t.index ["razones_sociale_id"], name: "index_pedidos_on_razones_sociale_id"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer  "cantidad"
    t.integer  "producto_id"
    t.integer  "pedido_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "productos", force: :cascade do |t|
    t.text     "nombre"
    t.text     "acabado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "razones_comerciales", force: :cascade do |t|
    t.string   "nombre"
    t.string   "area"
    t.string   "telefono1"
    t.string   "telefono2"
    t.integer  "razones_sociale_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["razones_sociale_id"], name: "index_razones_comerciales_on_razones_sociale_id"
  end

  create_table "razones_sociales", force: :cascade do |t|
    t.string   "nombre"
    t.string   "rfc"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.text     "notas"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_razones_sociales_on_user_id"
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
