# coding: utf-8

# Clase que maneja a los usuarios
class Usuario < ActiveRecord::Base
  # Solo para "validates_presence_of" se puede añadir varios campos
  validates_presence_of :nombre, :login, :pass, :fecha_nacimiento
  # Valida de que este campo sea único en toda la base de datos, osea que no exista otro igual en la tabla usuarios
  validates_uniqueness_of :login 

end
