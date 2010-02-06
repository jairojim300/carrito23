# coding: utf-8

# Clase que permite realizar migración, la migración autogenera
# de forma automática el SQL necesario para la Base de Datos
# es necesario ejecutar rake db:migrate
class CreateProductos < ActiveRecord::Migration
  def self.up
    create_table :productos do |t|
      t.string :nombre
      t.decimal :precio, :precision => 10, :scale => 2 # Se edita para decimal de 8 enteros 2 decimales

      t.timestamps
    end
  end

  def self.down
    drop_table :productos
  end
end
