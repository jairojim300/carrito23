# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100206120657) do

  create_table "compra_detalles", :force => true do |t|
    t.integer  "compra_id"
    t.integer  "producto_id"
    t.integer  "cantidad"
    t.decimal  "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compras", :force => true do |t|
    t.integer  "usuario_id"
    t.datetime "fecha"
    t.decimal  "total",      :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productos", :force => true do |t|
    t.string   "nombre"
    t.decimal  "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_file_name"
    t.integer  "foto_file_size"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "login"
    t.string   "pass"
    t.date     "fecha_nacimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo",             :default => "usuario"
  end

end
